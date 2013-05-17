FbStatusboard::Application.routes.draw do

  root :to => 'chart#index' 
  get '/statusboard' => 'chart#index'
end
