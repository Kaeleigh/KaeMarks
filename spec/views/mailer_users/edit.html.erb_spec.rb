require 'rails_helper'

RSpec.describe "mailer_users/edit", type: :view do
  before(:each) do
    @mailer_user = assign(:mailer_user, MailerUser.create!(
      :name => "MyString",
      :email => "MyString",
      :login => "MyString"
    ))
  end

  it "renders the edit mailer_user form" do
    render

    assert_select "form[action=?][method=?]", mailer_user_path(@mailer_user), "post" do

      assert_select "input[name=?]", "mailer_user[name]"

      assert_select "input[name=?]", "mailer_user[email]"

      assert_select "input[name=?]", "mailer_user[login]"
    end
  end
end
