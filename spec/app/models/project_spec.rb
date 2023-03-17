# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:leader) { create(:user, email: 'jeff@jones.com', password: 'password1234') }

  before do
    leader
  end

  it 'can save project to the db' do
    project = described_class.new(name: 'Test Project', code: 'ABC1', status: 'ready', leader:)
    count_before = described_class.all.count
    project.save

    result = described_class.find_by(code: project.code)
    expect(described_class.all.count).to eq count_before + 1
    expect(result.code).to eq project.code
    expect(result.name).to eq project.name
    expect(result.comments).to eq []
    expect(result.users).to eq []
    expect(result.leader_id).to eq leader.id
  end

  context 'when comments exist' do
    let(:project) { create(:project, name: 'Test Project', code: 'ABC1', status: 'ready', leader:) }
    let(:project_2) { create(:project, name: 'Test Project 2', code: 'DEF456', status: 'ready', leader:) }
    let(:project_no_comments) { create(:project, name: 'Test Project 3', code: 'GHI789', status: 'in_progress', leader:) }
    let(:comment_1) { create(:comment, user: leader, project:) }
    let(:comment_2) { create(:comment, user: leader, project:) }
    let(:comment_3) { create(:comment, user: leader, project: project_2) }

    before do
      comment_1
      comment_2
      comment_3
      project_no_comments
    end

    it 'returns the coments' do
      result = described_class.find_by(code: project.code)
      expect(result.comments.count).to eq 2

      one, two = result.comments
      expect(one.id).to eq comment_1.id
      expect(two.id).to eq comment_2.id
    end

    it 'returns no coments' do
      result = described_class.find_by(code: project_no_comments.code)
      expect(result.comments.count).to eq 0
    end
  end

  context 'when calling valid? on a Project' do
    let(:project) { described_class.new(name: 'Test Project', code: 'ABC123', status: 'ready', leader:) }

    context 'when the name is blank' do
      it 'returns false' do
        project.name = nil
        expect(project).not_to be_valid
        expect(project.errors.messages).to eq({ name: ["can't be blank"] })
      end
    end

    context 'when the code is blank' do
      it 'returns false' do
        project.code = nil
        expect(project).not_to be_valid
        expect(project.errors.messages).to eq({ code: ["can't be blank", 'is too short (minimum is 4 characters)'] })
      end
    end

    context 'when the code is too short' do
      it 'returns false' do
        project.code = 'ABC'
        expect(project).not_to be_valid
        expect(project.errors.messages).to eq({ code: ['is too short (minimum is 4 characters)'] })
      end
    end

    context 'when the status is not valid' do
      it 'returns false' do
        project.status = '?????'
        expect(project).not_to be_valid
        expect(project.errors.messages).to eq({ status: ['is not included in the list'] })
      end
    end

    context 'when the leader is nil' do
      it 'returns true' do
        project.leader = nil
        expect(project).to be_valid
      end
    end
  end
end
