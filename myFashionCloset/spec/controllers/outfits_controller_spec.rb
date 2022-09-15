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
                expect(response).to redirect_to(root_path)     #3XX Redirect
                expect(flash[:alert]).to be_present
            end
        end

        context "with logged creator user" do
            it "returns the outfit's creation page" do
                user = User.create(
                   email: 'user@gmail.com',
                   password: 'password1234',
                   username: 'user',
                   creat: 1)

                sign_in user
                get :new
                expect(response).to have_http_status(200)
            end
        end
        
    end

    describe "POST #create" do
        context "user is a not creator" do
            it "returns to home page" do
                user = User.create(
                   email: 'user@gmail.com',
                   password: 'password1234',
                   username: 'user',
                   creat: nil)
                sign_in user
                post :create
                expect(response).to redirect_to(root_path)     #3XX Redirect
                expect(flash[:alert]).to be_present
            end
        end

        context "user is a creator" do
            it "saves the created outfit in db" do
                user = User.create(
                   email: 'user@gmail.com',
                   password: 'password1234',
                   username: 'user',
                   creat: 1)
                creator = Creator.create(firstName:"name",lastName:"last",birthday:"2002-03-24",gender:"F",styleDesc:"test",approved:true,user_id:user.id)
                user.update(creator_id:creator.id)
                capo = Capo.create(
                        nome: "capo",
                        descrizione: "desc",
                        categoria: "categoria",
                        sito: "sito"
                        )
                
                before_count = Outfit.count

                sign_in user
                post :create, :params => {:name=>"outfit",:description=>"description",:ids=>[capo.id]}
                
                expect(Outfit.count).not_to eq(before_count)    #New outfit has been added
            end
        end
    end
    

end