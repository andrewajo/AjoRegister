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
      if resource.source == 'facebook'
        Rails.logger.info "REDIRECTING TO SIGN UP"
        flash[:error] = resource.errors
        redirect_to main_app.facebook_register_path
      else
        respond_with resource, :location => new_user_registration_path
      end
    else
      flash.delete :recaptcha_error
      build_resource
      if resource.source == 'facebook'
        resource.skip_confirmation!
      end
      if resource.save
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_navigational_format?
          sign_up(resource_name, resource)
          if resource.source != 'facebook'
            respond_with resource, :location => after_sign_up_path_for(resource)
          else
            Rails.logger.info "REDIRECTING TO WORD OF THE DAY!"
            expire_session_data_after_sign_in!
            redirect_to main_app.facebook_word_of_the_day_path
          end
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
          expire_session_data_after_sign_in!
          if resource.source != 'facebook'
            respond_with resource, :location => after_inactive_sign_up_path_for(resource)
          else
            redirect_to main_app.facebook_word_of_the_day_path
          end
        end
      else
        clean_up_passwords resource
        if resource.source != 'facebook'
          respond_with resource
        else
          Rails.logger.info "REDIRECTING TO SIGN UP"
          Rails.logger.info resource.errors.to_json
          flash[:error] = resource.errors
          redirect_to main_app.facebook_register_path
        end
      end
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