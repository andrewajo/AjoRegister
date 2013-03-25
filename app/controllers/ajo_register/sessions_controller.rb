require_dependency "ajo_register/application_controller"
class AjoRegister::SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    if current_user?
      logout current_user
    end
    super
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