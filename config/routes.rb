Rails.application.routes.draw do
  devise_for :users, {:class_name => "AjoRegister::User", :module => :devise, :controllers => {:registrations => 'ajo_register/registrations'}}

  match '/registration_thank_you' => 'ajo_register/registrations#thank_you', :as => 'register_thank_you'

  devise_scope :user do
    root :to => 'registrations#new'
    authenticated :user do
      root :to => "ajo_register/registrations#thank_you"
    end
  end
end
