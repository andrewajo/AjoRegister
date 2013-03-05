require_dependency "ajo_register/application_controller"
class AjoRegister::ConfirmationsController < Devise::ConfirmationsController
  def after_inactive_sign_up_path_for(resource)
    main_app.after_sign_up_path
  end

  def new
    super
  end

  def create
    super
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