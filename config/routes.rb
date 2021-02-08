Rails.application.routes.draw do
  devise_for :users

  resources :projects, except: :show do
    resources :tasks, except: %i[index show]
  end

  root 'projects#index'
end
