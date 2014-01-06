module Alchemy
  module Oauth
    class UsersController < ApplicationController
      doorkeeper_for :all

      def show
        user = ::Alchemy::User.find(doorkeeper_token.resource_owner_id)
        render json: user
      end
    end
  end
end
