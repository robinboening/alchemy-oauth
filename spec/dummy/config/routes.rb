Rails.application.routes.draw do

  mount Alchemy::Engine => '/'

  mount Alchemy::Oauth::Engine => "/oauth"
end
