AjoRegister::Engine.routes.draw do
  devise_for :users, {:class_name => "AjoRegister::User", :module => :devise, :controllers => {:registrations => 'ajo_register/registrations', :passwords => 'ajo_register/passwords', :sessions => 'ajo_register/sessions', :confirmations => 'ajo_register/confirmations'}}

  match '/registration_thank_you' => 'ajo_register/registrations#thank_you', :as => 'register_thank_you'

  devise_scope :user do
    root :to => 'registrations#new'
  end
end
