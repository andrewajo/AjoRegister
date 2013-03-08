require_dependency "ajo_register/application_controller"
class AjoRegister::RegistrationsController < Devise::RegistrationsController
  def index
  end

  def new
    super
  end

  def create
    if !verify_recaptcha
      flash.delete :recaptcha_error
      build_resource
      resource.valid?
      resource.errors.add(:recaptcha, "* Please try again")
      clean_up_passwords(resource)
      respond_with resource, :location => :back
    else
      flash.delete :recaptcha_error
      super
    end
  end

  def edit
    super
  end

  def thank_you
  end

  protected
  def after_inactive_sign_up_path_for(resource)
    main_app.registration_thank_you_path
  end
end