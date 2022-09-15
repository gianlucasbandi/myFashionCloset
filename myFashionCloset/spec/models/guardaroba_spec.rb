require "rails_helper"

RSpec.describe Guardaroba, :type => :model do

    before do
        @user = FactoryBot.create(:user)
        @creator = FactoryBot.create(:creator, user: @user)
    end

    describe "Validations" do

        it "Wardrobe's creation it is valid with all the params" do
            session = Guardaroba.new(:user_id => 1, :immagine_capo => "capo", :nome_capo => "capo", :url => "url", :sito => "sito")
            expect(session).to be_valid
        end

        it "Wardrobe's creation it is not valid without an user_id" do
            session = Guardaroba.new(:immagine_capo => "capo", :nome_capo => "capo", :url => "url", :sito => "sito")
            expect(session).to_not be_valid
        end
    end

    describe "Associations" do

        it "has many capos" do
          assc = described_class.reflect_on_association(:capos)
          expect(assc.macro).to eq :has_many
        end

        it "belongs to a user" do
            assc = described_class.reflect_on_association(:user)
            expect(assc.macro).to eq :belongs_to
          end

    end

end