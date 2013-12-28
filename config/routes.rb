DiccionarioJerga::Application.routes.draw do
  resources :creators, only: [:show, :index]

  root to: 'words#index'
  resources :words , except: [:edit, :update, :destroy] do
    post 'upvote'
    post 'downvote'
  end
  
end
