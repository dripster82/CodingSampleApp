# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comments/edit', type: :view do
  let(:comment) {
    Comment.create!(
      body: 'MyText',
      project: nil,
      user: nil
    )
  }

  before do
    assign(:comment, comment)
  end

  it 'renders the edit comment form' do
    render

    assert_select 'form[action=?][method=?]', comment_path(comment), 'post' do
      assert_select 'textarea[name=?]', 'comment[body]'

      assert_select 'input[name=?]', 'comment[project_id]'

      assert_select 'input[name=?]', 'comment[user_id]'
    end
  end
end
