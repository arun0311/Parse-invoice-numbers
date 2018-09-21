Rails.application.routes.draw do
  root 'upload_user_story#index'
  post "upload_user_story/upload"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
