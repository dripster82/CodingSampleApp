# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/index', type: :view do
  let(:leader) { create(:user, email: 'jeff@jones.com', password: 'password1234') }

  before do
    assign(:projects, [
      Project.create!(
        name: 'Project Name',
        code: 'Code1',
        leader:,
        status: 'ready'
      ),
      Project.create!(
        name: 'Project Name',
        code: 'Code2',
        leader:,
        status: 'ready'
      )
    ])
  end

  it 'renders a list of projects' do
    render

    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Project Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Code1'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Code2'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new(leader.id.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('ready'.to_s), count: 2
  end
end
