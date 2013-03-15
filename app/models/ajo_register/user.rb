module AjoRegister
  class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :rememberable, :trackable
  
    # Setup accessible (or protected) attributes for your model
    attr_accessible :password, :password_confirmation, :remember_me, :source, :facebook_id, :age_of_consent, :city, :email, :first_name, :gender, :last_name, :mailing_address, :opt_in, :opt_in_confirmed, :province, :rules_and_regulations, :password, :password_confirmation, :date_of_birth

    validates_presence_of :first_name, :message => I18n.t('register.form_errors.first_name.required')
    validates_presence_of :last_name, :message => I18n.t('register.form_errors.last_name.required')
    validates_presence_of :email, :message => I18n.t('register.form_errors.email.required')
    validates_uniqueness_of :email, :message => I18n.t('register.form_errors.email.unique'), :if =>:facebook_registration?
    validates_format_of :email, :with => Devise.email_regexp, :message => I18n.t('register.form_errors.email.format')
    validates_presence_of :gender, :message => I18n.t('register.form_errors.gender.required')
    validates_presence_of :date_of_birth, :message => I18n.t('register.form_errors.date_of_birth.required')
    validates_presence_of :mailing_address, :message => I18n.t('register.form_errors.mailing_address.required')
    validates_presence_of :city, :message => I18n.t('register.form_errors.city.required')
    validates_presence_of :province, :message => I18n.t('register.form_errors.province.required')
    validates_presence_of :password, :message => I18n.t('register.form_errors.password.required'), :on => :create, :if => :password_required?
    validates_confirmation_of :password, :message => I18n.t('register.form_errors.password.confirmation'), :on => :create, :if => :password_required?
    validates_presence_of :password_confirmation, :message => I18n.t('register.form_errors.password_confirmation.required'), :on => :create, :if => :password_required?
    validates :rules_and_regulations, :acceptance => {:accept => true, :message => I18n.t('register.form_errors.rules_and_regulations.agree')}
    validates_presence_of     :password, :message => I18n.t('register.form_errors.password.required'), :on => :create, :if => :password_required?
    validates_confirmation_of :password, :message => I18n.t('register.form_errors.password.confirmation'), :on => :create, :if => :password_required?
    validates_length_of       :password, :message => I18n.t('register.form_errors.password.length'), :on => :create, :in => 5..25, :allow_blank => true

    def password_required?
      # If resetting the password
      return true if reset_password_token.present? && reset_password_period_valid? || self.source != 'facebook'

      # If the person already has a pass, only validate if they are updating pass
      if !encrypted_password.blank?
        password.present? || password_confirmation.present?
      end
    end

    def facebook_registration?
      return true unless self.source == 'facebook'
    end
  end
end
