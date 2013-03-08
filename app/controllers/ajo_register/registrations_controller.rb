require_dependency "ajo_register/application_controller"
class AjoRegister::RegistrationsController < Devise::RegistrationsController
  def index
  end

  def new
    super
  end

  def create
    if verify_recaptcha
      super
    else
      build_resource
      clean_up_passwords(resource)
      resource.errors.add(:recaptcha, 'Incorrect. Please try again!')
      render :new
    end
  end

  def edit
    super
  end

  def thank_you
  end
  protected

  def after_update_path_for(resource)
    Rails.logger.info "CALLED"
    user_path(resource)
  end
end