require 'rails_helper'

RSpec.describe "MailerUsers", type: :request do
  describe "GET /mailer_users" do
    it "works! (now write some real specs)" do
      get mailer_users_path
      expect(response).to have_http_status(200)
    end
  end
end
