require 'rails_helper'

RSpec.describe IncomingController, type: :controller do
  describe "POST create" do
    context "user exists" do
      it "creates a bookmark if the topic exists" do
        user = User.create!(email: 'test@test.test', password: 'password')
        topic = user.topics.create!(title: 'title')

        post :create, params: {
          sender: user.email,
          subject: topic.title,
          :"body-plain" => "url.com"
        }

        expect(Bookmark.find_by(url: "url.com", topic: topic)).to be_present
      end


      it "creates a topic and a bookmark if the topic does not exist" do
        user = User.create!(email: 'test@test.test', password: 'password')

        post :create, params: {
          sender: user.email,
          subject: topic.title,
          :"body-plain" => "url.com"
        }

        expect(Bookmark.find_by(url: "url.com", topic: topic)).to be_present
      end

      it "returns status 200" do
        user = User.create!(email: 'test@test.test', password: 'password')
        topic = user.topics.create!(title: 'title')

        post :create, params: {
          sender: user.email,
          subject: topic.title,
          :"body-plain" => "url.com"
        }

        expect(response.status).to eq 200
      end
    end

    context "user does not exist" do
      it "returns status 404" do
        user = User.create!(email: 'test@test.test', password: 'password')

        post :create, params: { sender: 'does@not.exist' }

        expect(response.status).to eq 404
      end
    end
  end
end
