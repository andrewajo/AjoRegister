require_dependency "ajo_register/application_controller"
class AjoRegister::ConfirmationsController < Devise::ConfirmationsController
  def new
    super
  end

  def create
    if resource.source == 'facebook'
      Rails.logger.info "SEND FACEBOOK"
    else
      self.resource = resource_class.send_confirmation_instructions(resource_params)
    end
    if successfully_sent?(resource)
      respond_with({}, :location => after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    if resource.errors.empty?
      set_flash_message(:notice, :confirmed) if is_navigational_format?
      sign_in(resource_name, resource)
      redirect_to main_app.double_opt_in_path
    else
      respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :new }
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