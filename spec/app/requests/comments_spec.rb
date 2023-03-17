# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/comments', type: :request do
  let(:user) { create(:user, email: 'jeff@jones.com', password: 'password1234') }
  let(:project) { create(:project) }
  let(:valid_attributes) do
    {
      body: 'Hello World!',
      project_id: project.id,
      user_id: user.id
    }
  end
  let(:invalid_attributes) do
    { body: nil }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Comment.create! valid_attributes
      get comments_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      comment = Comment.create! valid_attributes
      get comment_url(comment)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_comment_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      comment = Comment.create! valid_attributes
      get edit_comment_url(comment)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Comment' do
        expect {
          post comments_url, params: { comment: valid_attributes }
        }.to change(Comment, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Comment' do
        expect {
          post comments_url, params: { comment: invalid_attributes }
        }.not_to change(Comment, :count)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { body: 'New World' }
      end

      it 'updates the requested comment' do
        comment = Comment.create! valid_attributes
        patch comment_url(comment), params: { comment: new_attributes }
        comment.reload
        expect(comment.body).to eq new_attributes[:body]
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        comment = Comment.create! valid_attributes
        patch comment_url(comment), params: { comment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested comment' do
      comment = Comment.create! valid_attributes
      expect {
        delete comment_url(comment)
      }.to change(Comment, :count).by(-1)
    end
  end
end
