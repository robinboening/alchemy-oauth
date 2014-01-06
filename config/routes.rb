Alchemy::Oauth::Engine.routes.draw do

  get '/user', to: 'oauth/users#show'

end

Rails.application.routes.prepend do

  use_doorkeeper

  namespace :admin do
    get '/oauth', to: redirect('/oauth/applications')
  end
end