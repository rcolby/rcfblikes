FbStatusboard::Application.routes.draw do

  root :to => 'chart#index' 
  get '/statusboard.json' => 'chart#statusboard'
  get '/morris.json' => 'chart#morris'
  get '/d3' => 'chart#d3'
end
