module AjoRegister
  class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :rememberable, :trackable, :validatable
  
    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me
    attr_accessible :age_of_consent, :city, :email_address, :first_name, :gender, :last_name, :mailing_address, :opt_in, :province, :rules_and_regulations, :password, :password_confirmation, :date_of_birth

    validates_presence_of :first_name, :message => I18n.t('register.form_errors.first_name.required')
    validates_presence_of :last_name, :message => I18n.t('register.form_errors.last_name.required')
    validates_presence_of :email, :message => I18n.t('register.form_errors.email.required')
    validates_presence_of :gender, :message => I18n.t('register.form_errors.gender.required')
    validates_presence_of :date_of_birth, :message => I18n.t('register.form_errors.date_of_birth.required')
    validates_presence_of :mailing_address, :message => I18n.t('register.form_errors.mailing_address.required')
    validates_presence_of :city, :message => I18n.t('register.form_errors.city.required')
    validates_presence_of :province, :message => I18n.t('register.form_errors.province.required')
    validates_presence_of :password, :password => I18n.t('register.form_errors.password.required')
    validates_presence_of :password_confirmation, :password => I18n.t('register.form_errors.password_confirmation.required')


  end
end
