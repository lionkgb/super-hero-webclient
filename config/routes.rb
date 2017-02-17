Rails.application.routes.draw do
 post "/superheroes" => 'super_heroes#create'
 get "/" => 'super_heroes#index'
 get "/superheroes" => 'super_heroes#new' 
 get "/superheroes/:id", to: 'super_heroes#show'
 get "/superheroes/:id/edit" => 'super_heroes#edit'
 patch "/superheroes/:id" => 'super_heroes#update'
 delete "/superheroes/:id" => 'super_heroes#destroy'
end
