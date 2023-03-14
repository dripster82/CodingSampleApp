# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/show', type: :view do
  before do
    assign(:project, Project.create!(
      name: 'Name',
      code: 'Code',
      leader: nil
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(//)
  end
end
