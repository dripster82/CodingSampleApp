# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/edit', type: :view do
  let(:leader) { create(:user, email: 'jeff@jones.com', password: 'password1234') }
  let(:project) {
    Project.create!(
      name: 'MyString',
      code: 'MyString',
      leader:,
      status: 'ready'
    )
  }

  before do
    assign(:project, project)
  end

  it 'renders the edit project form' do
    render

    assert_select 'form[action=?][method=?]', project_path(project), 'post' do
      assert_select 'input[name=?]', 'project[name]'

      assert_select 'input[name=?]', 'project[code]'

      assert_select 'input[name=?]', 'project[leader_id]'
    end
  end
end
