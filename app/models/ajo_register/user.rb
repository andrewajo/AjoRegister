module AjoRegister
  class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :rememberable, :trackable
  
    # Setup accessible (or protected) attributes for your model
    attr_accessible :password, :password_confirmation, :remember_me, :source, :facebook_id, :age_of_consent, :city, :email, :first_name, :gender, :last_name, :mailing_address, :opt_in, :opt_in_confirmed, :province, :rules_and_regulations, :password, :password_confirmation, :date_of_birth

    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :email
    validate :email_unique
    validates_format_of :email, :with => Devise.email_regexp
    validates_presence_of :gender
    validates_presence_of :date_of_birth
    validates_presence_of :mailing_address
    validates_presence_of :city
    validates_presence_of :province
    validates :rules_and_regulations, :acceptance => {:accept => true}

    validates_presence_of :password, :if => :password_required?
    validates_confirmation_of :password, :if => :password_required?
    validates_presence_of :password_confirmation, :if => :password_required?
    validates_length_of :password, :in => 5..25, :allow_blank => true

    def password_required?
      # If resetting the password
      return true if reset_password_token.present? && reset_password_period_valid? || self.source != 'facebook'

      # If the person already has a pass, only validate if they are updating pass
      if !encrypted_password.blank?
        password.present? || password_confirmation.present?
      end
    end

    def email_unique
      self.errors.add('email', :unique) if User.where('email = ? AND source = ?', self.email, self.source).count > 0
    end

    def self.find_for_database_authentication(conditions={})
       self.where("email = ? && source = ?", conditions[:email], 'microsite').limit(1).first
    end
  end
end
