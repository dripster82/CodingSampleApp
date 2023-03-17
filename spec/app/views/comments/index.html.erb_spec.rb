# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comments/index', type: :view do
  let(:leader) { create(:user, email: 'jeff@jones.com', password: 'password1234') }
  let(:project) { create(:project, name: 'Test Project', code: 'ABC1', status: 'ready', leader:) }
  let(:comment_1) { create(:comment, project:, user: leader) }
  let(:comment_2) { create(:comment, project:, user: leader) }

  before do
    assign(:comments, [comment_1, comment_2])
  end

  it 'renders a list of comments' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(project.id.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(leader.id.to_s), count: 2
  end
end
