require_dependency "ajo_register/application_controller"
class AjoRegister::PasswordsController < Devise::PasswordsController

  def new
    super
  end

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)

    if successfully_sent?(resource)
      respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
    else
      redirect_to :back, :flash => {:reset_error => I18n.t('login.invalid_email')}
    end
  end

  def destroy
    super
  end

  def edit
    super
  end

  def update
    super
  end

end