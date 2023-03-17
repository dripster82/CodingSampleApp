# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/show', type: :view do
  let(:leader) { create(:user, email: 'jeff@jones.com', password: 'password1234') }

  before do
    assign(:project, Project.create!(
      name: 'Name',
      code: 'Code',
      leader:,
      status: 'ready'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(//)
  end
end
