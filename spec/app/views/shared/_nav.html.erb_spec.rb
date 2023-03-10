# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shared/_nav.html.erb', type: :view do
  it 'renders correct nav elements' do
    render
    assert_select 'a', count: 3
    assert_select 'a', text: 'Home'.to_s, count: 1
    assert_select 'a', text: 'Blog'.to_s, count: 1
    assert_select 'a', text: 'Contact Us'.to_s, count: 1
  end

  context 'when on the home page' do
    it 'adds the active class to the home link' do
      allow(view).to receive(:current_page?).with(root_path).and_return(true)
      render
      assert_select 'a', count: 3
      assert_select 'a.active', text: 'Home'.to_s, count: 1
    end
  end
end
