# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/new', type: :view do
  let(:leader) { create(:user, email: 'jeff@jones.com', password: 'password1234') }

  before do
    assign(:project, Project.new(
      name: 'MyString',
      code: 'MyString',
      leader:,
      status: 'ready'
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
