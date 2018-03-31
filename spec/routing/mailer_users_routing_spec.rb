require "rails_helper"

RSpec.describe MailerUsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mailer_users").to route_to("mailer_users#index")
    end

    it "routes to #new" do
      expect(:get => "/mailer_users/new").to route_to("mailer_users#new")
    end

    it "routes to #show" do
      expect(:get => "/mailer_users/1").to route_to("mailer_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mailer_users/1/edit").to route_to("mailer_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mailer_users").to route_to("mailer_users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mailer_users/1").to route_to("mailer_users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mailer_users/1").to route_to("mailer_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mailer_users/1").to route_to("mailer_users#destroy", :id => "1")
    end

  end
end
