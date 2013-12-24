DiccionarioJerga::Application.routes.draw do
  root to: 'words#index'
  
  resources :words do 
    resources :definitions
  end
  
end
