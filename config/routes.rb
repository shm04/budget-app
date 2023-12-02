Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}
  
root 'groups#index'

resources :groups do
  resources :entities
end

end
