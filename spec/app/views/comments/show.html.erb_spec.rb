# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comments/show', type: :view do
  before do
    assign(:comment, Comment.create!(
      body: 'MyText',
      project: nil,
      user: nil
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
