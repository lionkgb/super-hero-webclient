Rails.application.routes.draw do
 get "/superheroes/:id", to: 'super_heroes#show'
end
