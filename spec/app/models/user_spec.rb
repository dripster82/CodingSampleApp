require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#email' do
    let(:email_address) { 'test@example.com' }

    it 'exists and can be initialised' do
      user = described_class.new(email: email_address)
      expect(user.email).to eq email_address
    end
  end

  describe '#password' do
    let(:password) { 'password123!' }
    it 'exists and can be initialised' do
      user = described_class.new(password: password)
      expect(user.password).to eq password
    end

    context "when fetched from the DB" do
      let(:email_address) { 'test2@example.com' }

      it "should have an encrypted password value only" do

        user = described_class.new(email: email_address, password: password)
        user.save

        saved_user = User.find_by(email: email_address)
        expect(saved_user.email).to eq email_address
        expect(saved_user.password).to be_nil
        expect(saved_user.encrypted_password).not_to be_nil
      end
    end
  end
end
