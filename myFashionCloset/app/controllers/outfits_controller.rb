class OutfitsController < ApplicationController
    before_action :authenticate_user!, except: [:index,:search]

    def index
        if user_signed_in?  
            @user = current_user
            @followedCreators = @user.followedCreators      

            @followedOutfits = Array.new
            @followedCreators.each do |creator|         #Getting recent outfit from followed creators
                item = creator.outfits.order(created_at: :desc).take(2)
                item.each do |i|
                    @followedOutfits.push(i)
                end  
            end

        end
            @recentOutfits = Outfit.order(created_at: :desc)  #Getting recent outfit posted

    end

    def new
        @user = current_user

        if @user.creator_id != nil && Creator.find(@user.creator_id).approved != true
            flash[:alert] = "Only creators can post new outfits"
            redirect_to root_path
        else
            @outfit = Outfit.new
            @q = Capo.ransack(params[:q])
            @capos = @q.result(distinct: true)
        end
        
    end

    def create
        @user = current_user

        if @user.creator_id != nil && Creator.find(@user.creator_id).approved != true
            flash[:alert] = "Only creators can post new outfits"
            redirect_to root_path

        else
            @creator = Creator.find(@user.creator_id);
            @outfit = Outfit.new();
            @outfit.name = params[:name];
            @outfit.description = params[:description];
            @outfit.creator_id = @creator.id;
            
            ids = params[:ids];

            if @outfit.save
                for i in ids do
                    @capo = Capo.find(i) 
                    @outfit.capos.push(@capo)
                end
                "done"
            else
                "error"
            end
        end
    end


    def show
        begin
            @outfit = Outfit.find(params[:id])
            @creator = Creator.find(@outfit.creator_id)
            @user = User.find(@creator.user_id)
            @capos = @outfit.capos;
        rescue =>e
            flash[:alert] = "Searched outfit doesn't exist"
            redirect_to root_path
        end
    end

    def destroy
        @outfit = Outfit.find(params[:id])
        @outfit.destroy

        respond_to do |format|
            format.html { redirect_to admin_url, notice: "Outfit was successfully deleted." }
            format.json { head :no_content }
        end
    end

    #Endpoint to search capos without page reload
    def search
        @q = Capo.ransack(params)
        @capos = @q.result(distinct: true)
        render json:  @capos;       #Return a json to ajax callback
    end
    
end
