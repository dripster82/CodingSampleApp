require 'rails_helper'

RSpec.describe "pages/home/index.html.erb", type: :view do
  it "renders the correct page" do
    render
    assert_select "h1", text: 'Home Page'.to_s, count: 1
  end

  it "renders login / sign up" do
    render
    assert_select "a", text: 'Sign Up!'.to_s, count: 1
    assert_select "a", text: 'Login'.to_s, count: 1
    assert_select "a", text: 'Sign Out'.to_s, count: 0
  end

  context "when logged in" do
    it "renders sign out" do
      allow(view).to receive(:current_user).and_return(User.new)
      render
      assert_select "a", text: 'Sign Up!'.to_s, count: 0
      assert_select "a", text: 'Login'.to_s, count: 0
      assert_select "a", text: 'Sign Out'.to_s, count: 1
    end
  end
end
