require 'rails_helper'

RSpec.describe "pages/home/index.html.erb", type: :view do
  it "renders the correct page" do
    render
    assert_select "h1", text: 'Home Page'.to_s, count: 1
  end
end
