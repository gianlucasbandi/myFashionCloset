require 'rails_helper'

RSpec.describe OutfitsController, type: :controller do
    
    describe "GET #new" do
        context "with unlogged user" do
            it "returns to login page" do
                get :new
                expect(response).to redirect_to(new_user_session_path)
                expect(flash[:alert]).to be_present
            end
        end

        context "with logged not creator user" do
            it "returns to home page" do
                user = User.create(
                   email: 'user@gmail.com',
                   password: 'password1234',
                   username: 'user',
                   creat: nil)

                sign_in user
                get :new
                expect(response).to redirect_to(root_path)  #Viene riportata all user_sign
                expect(flash[:alert]).to be_present
            end
        end
        
    end
    

end