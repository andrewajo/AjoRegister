require_dependency "ajo_register/application_controller"
class AjoRegister::RegistrationsController < Devise::RegistrationsController
  def after_inactive_sign_up_path_for(resource)
    '/registration_thank_you'
  end

  def index
  end

  def new
    super
  end

  def thank_you
  end
end