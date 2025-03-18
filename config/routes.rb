Rails.application.routes.draw do
  resources :tasks do
    member do
      patch :update_progress
      patch :mark_as_done
    end
  end
  root "tasks#index"
end
