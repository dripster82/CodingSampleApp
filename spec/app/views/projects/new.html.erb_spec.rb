# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/new', type: :view do
  before do
    assign(:project, Project.new(
      name: 'MyString',
      code: 'MyString',
      leader: nil
    ))
  end

  it 'renders new project form' do
    render

    assert_select 'form[action=?][method=?]', projects_path, 'post' do
      assert_select 'input[name=?]', 'project[name]'

      assert_select 'input[name=?]', 'project[code]'

      assert_select 'input[name=?]', 'project[leader_id]'
    end
  end
end
