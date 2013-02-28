require_dependency "ajo_register/application_controller"
class AjoRegister::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    '/registration_thank_you'
  end

  def index
  end

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end



  def thank_you
  end
end