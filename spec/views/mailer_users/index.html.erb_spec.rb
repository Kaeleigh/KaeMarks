require 'rails_helper'

RSpec.describe "mailer_users/index", type: :view do
  before(:each) do
    assign(:mailer_users, [
      MailerUser.create!(
        :name => "Name",
        :email => "Email",
        :login => "Login"
      ),
      MailerUser.create!(
        :name => "Name",
        :email => "Email",
        :login => "Login"
      )
    ])
  end

  it "renders a list of mailer_users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Login".to_s, :count => 2
  end
end
