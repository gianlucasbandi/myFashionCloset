require 'rails_helper'

RSpec.describe Creator, type: :model do

    before do
        @user = FactoryBot.create(:user)
        @creator = FactoryBot.create(:creator, user: @user)
    end

    describe "Creator" do
        it "should be created successfully after his request" do
            expect(@creator).to be_valid
        end
    end

    describe 'Validations' do
        it 'should not be valid without an user id' do
          @creator.user_id = nil
          expect(@creator).to_not be_valid
        end
        it 'should not be valid if his user id do not corrispond to any user' do
          if @creator.user_id != @user.id
            expect(@creator).to_not be_valid
          end
        end
    end

    describe "Associations" do
        it "has many outfits" do
          assc = described_class.reflect_on_association(:outfits)
          expect(assc.macro).to eq :has_many
        end
        it "has many follows" do
          assc = described_class.reflect_on_association(:follows)
          expect(assc.macro).to eq :has_many
        end
        it "has many following users" do
          assc = described_class.reflect_on_association(:followingUsers)
          expect(assc.macro).to eq :has_many
        end
        it "has many following reports" do
          assc = described_class.reflect_on_association(:reports)
          expect(assc.macro).to eq :has_many
        end
        it "belongs to one user" do
          assc = described_class.reflect_on_association(:user)
          expect(assc.macro).to eq :belongs_to
        end
    end

end