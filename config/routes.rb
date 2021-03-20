Rails.application.routes.draw do
  root 'projects#index'
  
  devise_for :users , controllers: { registrations: 'registrate' }


  resources :projects do 
    resources :developerbugs 
    resources :developerprojects
    resources :developers
  end
end