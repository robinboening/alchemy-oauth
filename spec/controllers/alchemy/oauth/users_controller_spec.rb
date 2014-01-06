require 'spec_helper'

describe Alchemy::Oauth::UsersController do

  routes { Alchemy::Oauth::Engine.routes }

  context "with missing access token" do

    describe "#show" do

      it "responds with unauthorized status" do
        get :show
        response.status.should == 401
      end
    end
  end

  context "with the correct access token" do

    let(:token) { double(accessible?: true, resource_owner_id: 1) }
    let(:user) { Alchemy::User.new(firstname: 'Foo', lastname: 'Bar', email: 'mail@example.com') }

    before do
      Alchemy::User.stub(:find).once { user }
      controller.stub(:doorkeeper_token).and_return(token)
    end

    describe "#show" do

      it "responds with 200 status" do
        get :show
        response.status.should == 200
      end

      it "responds with json of the user" do
        get :show
        result = JSON.parse(response.body)
        result['firstname'].should == user.firstname
        result['lastname'].should == user.lastname
        result['email'].should == user.email
      end

      it "sends the admin status" do
        user.stub(:roles).and_return(['registered', 'admin'])
        get :show
        result = JSON.parse(response.body)
        result['roles'].should include('admin')
      end
    end
  end
end