require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:bookmark) { Bookmark.create!(url: "www.JaSam.com") }

  describe "associations" do
    it { is_expected.to belong_to(:topic) } 

  end
end
