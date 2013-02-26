AjoRegister::Engine.routes.draw do
  devise_for :users, :controllers => {:registrations => 'ajo_register/registrations'}, :class_name => "AjoRegister::User", module: :devise

  match '/registration_thank_you' => 'ajo_register/registrations#thank_you', :as => 'register_thank_you'
  devise_scope :user do
    root :to => 'devise/registrations#new'
    authenticated :user do
      root :to => "ajo_register/registrationsd#thank_you"
    end
  end

  Rails.application.routes.draw do
    devise_for :users, :controllers => {:registrations => 'ajo_register/registrations'}, :class_name => "AjoRegister::User", module: :devise

    match '/registration_thank_you' => 'ajo_register/registrations#thank_you', :as => 'register_thank_you'
    devise_scope :user do
      root :to => 'devise/registrations#new'
      authenticated :user do
        root :to => "ajo_register/registrationsd#thank_you"
      end
    end

  end
end
