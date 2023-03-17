# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comments/show', type: :view do
  let(:leader) { create(:user, email: 'jeff@jones.com', password: 'password1234') }
  let(:project) { create(:project, name: 'Test Project', code: 'ABC1', status: 'ready', leader:) }
  let(:comment) { create(:comment, project:, user: leader) }

  before do
    assign(:comment, comment)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
