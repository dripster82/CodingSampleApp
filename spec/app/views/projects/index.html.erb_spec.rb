# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/index', type: :view do
  before do
    assign(:projects, [
      Project.create!(
        name: 'Name',
        code: 'Code',
        leader: nil
      ),
      Project.create!(
        name: 'Name',
        code: 'Code',
        leader: nil
      )
    ])
  end

  it 'renders a list of projects' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Code'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
