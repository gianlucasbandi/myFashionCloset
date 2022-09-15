require 'rails_helper'

RSpec.describe CreatorsController, type: :controller do

	before(:each) do
		@user = create(:user)
		@creator = create(:creator, user: @user)
        @outfit = create(:outfit, creator: @creator)
    end

    describe "GET #show" do

		context "with a creator not approved" do
			it "returns to the homepage" do
                @creator.approved = nil
				get :show, params: {id: @creator.id}         
                expect(flash[:alert]).to be_present
                expect(response.status).to eq(302)
				expect(response).to redirect_to(root_path)
			end
		end

        context "with a creator approved" do
            it "returns a success response" do
                @creator = Creator.create(
                    firstName: "CreatorName",
                    lastName: "CreatorLastName",
                    birthday: "2002-03-24",
                    styleDesc: "CreatorMessage",
                    user_id: @user.id,
                    approved: true)
                get :show, params: {id: @creator.id}
                expect(response.status).to eq(200)
            end
        end

    end

    describe "GET #new" do

        context "with not logged user" do
			it "go back to log in page" do
				expect(controller.user_signed_in?).to be false
				get :new, params: {:id => @creator.id}
				expect(response).to redirect_to(new_user_session_path)
				expect(response).not_to be_successful
            end
        end

        context "with a banned creator" do 
            it "go back to homepage" do
                @user = User.create(
                    username: "esempio",
                    email: "esempio@gmail.com",
                    password: "Password1234",
                    creat: false,
                    creator_id: nil
                )
                allow(controller).to receive(:authenticate_user!).and_return(true)
                allow(controller).to receive(:current_user).and_return(@user)
                get :new, params: {:id => @user.id}
                expect(flash[:alert]).to be_present
                expect(response.status).to eq(302)
				expect(response).to redirect_to(root_path)
            end
        end

        context "with a request already sent" do 
            it "go back to homepage" do
                @user = User.create(
                    username: "esempio",
                    email: "esempio@gmail.com",
                    password: "Password1234",
                    creat: false,
                    creator_id: 1
                )    
                @creator = Creator.create(
                    firstName: "CreatorName",
                    lastName: "CreatorLastName",
                    birthday: "2002-03-24",
                    styleDesc: "CreatorMessage",
                    user_id: @user.id,
                    approved: false
                )
                allow(controller).to receive(:authenticate_user!).and_return(true)
                allow(controller).to receive(:current_user).and_return(@user)
                get :new, params: {:id => @user.id}
                expect(flash[:alert]).to be_present
                expect(response.status).to eq(302)
				expect(response).to redirect_to(root_path)
            end
        end

        context "with a logged user not creator" do
			it "go back to log in page" do
                @user = User.create(
                    username: "esempio",
                    email: "esempio@gmail.com",
                    password: "Password1234",
                    creat: nil,
                    creator_id: nil
                )
				allow(controller).to receive(:authenticate_user!).and_return(true)
                allow(controller).to receive(:current_user).and_return(@user)
				get :new, params: {:id => @user.id}
				expect(response.status).to eq(200)
				expect(response).to be_successful
            end
        end
    end
end
