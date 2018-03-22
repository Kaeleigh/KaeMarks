require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      user = User.new(email: 'email@email.email', password: 'password')
      user.skip_confirmation!
      user.save!

      topic = user.topics.create!(title: "title")
      bookmark = topic.bookmarks.create(url: "url")

      sign_in user

      get :show, params: { topic_id: topic.id, id: bookmark.id }

      expect(response).to have_http_status(:success)
    end

    it "correctly assigns @bookmark" do
      user = User.new(email: 'email@email.email', password: 'password')
      user.skip_confirmation!
      user.save!

      topic = user.topics.create!(title: "title")
      bookmark = topic.bookmarks.create(url: "url")

      sign_in user

      get :show, params: { topic_id: topic.id, id: bookmark.id }

      expect(assigns[:bookmark]).to eq bookmark
    end
  end

  describe "GET #new" do
    it "returns http success" do
      user = User.new(email: 'email@email.email', password: 'password')
      user.skip_confirmation!
      user.save!

      topic = user.topics.create!(title: "title")
      bookmark = topic.bookmarks.create(url: "url")

      sign_in user

      get :new, params: { topic_id: topic.id, id: bookmark.id }

      expect(response).to have_http_status(:success)
    end

    it "correctly assigns @bookmark" do
      user = User.new(email: 'email@email.email', password: 'password')
      user.skip_confirmation!
      user.save!

      topic = user.topics.create!(title: "title")
      bookmark = topic.bookmarks.create(url: "url")

      sign_in user

      get :new, params: { topic_id: topic.id, id: bookmark.id }

      expect(assigns[:bookmark]).to eq bookmark
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      user = User.new(email: 'email@email.email', password: 'password')
      user.skip_confirmation!
      user.save!

      topic = user.topics.create!(title: "title")
      bookmark = topic.bookmarks.create(url: "url")

      sign_in user

      get :edit, params: { topic_id: topic.id, id: bookmark.id }

      expect(response).to have_http_status(:success)
    end
    it "correctly assigns @bookmark" do
      user = User.new(email: 'email@email.email', password: 'password')
      user.skip_confirmation!
      user.save!

      topic = user.topics.create!(title: "title")
      bookmark = topic.bookmarks.create(url: "url")

      sign_in user

      get :edit, params: { topic_id: topic.id, id: bookmark.id }

      expect(assigns[:bookmark]).to eq bookmark
    end
  end

end
