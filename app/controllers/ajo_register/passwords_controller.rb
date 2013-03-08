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
      redirect_to :back, :flash => {:reset_error => 'Invalid Email'}
    end
  end

  def destroy
    super
  end

  def edit
    super
  end

  def update
    self.resource = resource_class.reset_password_by_token(resource_params)

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => after_sign_in_path_for(resource)
    else
      @errors = resource.errors
      respond_with resource, :location => main_app.edit_password_url(resource, :reset_password_token => resource.reset_password_token)
    end
  end

end