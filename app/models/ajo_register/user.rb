module AjoRegister
  class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :rememberable, :trackable, :validatable
  
    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me
    attr_accessible :age_of_consent, :city, :email_address, :first_name, :gender, :last_name, :mailing_address, :opt_in, :province, :rules_and_regulations, :year_of_birth, :password, :password_confirmation, :date_of_birth

    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :email
    validates_presence_of :gender
    validates_presence_of :year_of_birth
    validates_presence_of :mailing_address
    validates_presence_of :city
    validates_presence_of :province
    validates_presence_of :password
    validates_presence_of :password_confirmation


  end
end
