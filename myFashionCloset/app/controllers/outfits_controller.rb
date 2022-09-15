class OutfitsController < ApplicationController
    before_action :authenticate_user!, except: [:index,:search,:load,:renderHTML]

    def index
        if user_signed_in?  
            @user = current_user
            @creator = @user.creator
            @isCreator = false
            if(@creator != nil && @creator.approved == true)
                @isCreator = true
            end
            

            #Take first 3 recent post from followed Creators
            @followedOutfits = Outfit.where(creator_id:@user.followedCreator_ids).order(created_at: :desc).take(3)
        end
            #Getting recent outfit posted
            @recentOutfits = Outfit.order(created_at: :desc).take(3)                                 

    end

    #Load more content when user scroll down the homepage (post via ajax)
    def load
        @followedOutfits

        if user_signed_in?
            @user = current_user
            if(params[:lastIsFollowed] == "true")
                #Take first 3 recent post from followed Creators
                @followedOutfits = Outfit.where(creator_id:@user.followedCreator_ids).where("id < ?",params[:last]).order(created_at: :desc).take(3)
                if(@followedOutfits.length != 0)
                    render json: [@followedOutfits,true]
                    return 
                end            
            end
        end

        @recentOutfits = Outfit.where("id < ?",params[:last]).order(created_at: :desc).take(3)
        render json: [@recentOutfits,false]
    end


    #Take care of the rendering of the new content when load is called
    def renderHTML
        @outfit = Outfit.find(params[:id])

        @html = '<div class="card text-center outfit" id = '+@outfit.id.to_s+'>
        <div class="card-header">
            <div class = "profile-pic">
                <a href = "'+creator_path(@outfit.creator.id)+'">
                    <img class = "avatar" src="'+(url_for(@outfit.creator.user.avatar))+'">
                </a>
                <p>'+@outfit.creator.user.username+'</p>
            </div>

            <div class = "outfit-name">
                <p>'+@outfit.name+'</p>
            </div>

        </div>

        <div class="card-body"> 
            <div id = "carousel'+@outfit.id.to_s+'" class = "carousel slide" data-ride="carousel">
                <div class = "carousel-inner">'

        @outfit.capos.each_with_index do |capo,index|
            if index == 0
                @html = @html+'<div class = "carousel-item active">
                <img class="d-block w-100" src = '+url_for(capo.immagine)+'>
                <div class="carousel-caption d-none d-md-block">
                    <h6>'+capo.nome+'</h6>
                </div>
            </div>'

            else
                @html = @html+'<div class = "carousel-item">
                    <img class="d-block w-100" src = '+url_for(capo.immagine)+'>
                    <div class="carousel-caption d-none d-md-block">
                        <h6>'+capo.nome+'</h6>
                    </div>
                </div>'
            end

        end
                
                
        @html = @html +'</div>

                <a class="carousel-control-prev" href="#carousel'+@outfit.id.to_s+'" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel'+@outfit.id.to_s+'" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="card-footer text-muted">
            <div class = "outfit-description">
                '+@outfit.description+'
            </div>
            <div class = "outfit-date">
                '+@outfit.created_at.to_s+'
            </div>
        </div>
    </div>'

        render json: {"string":@html}
    end

    def new
        @user = current_user

        @outfit = Outfit.new
        authorize! :new, @outfit, :message => "BEWARE: you are not
        authorized to access this page"
        @q = Capo.ransack(params[:q])
        @capos = @q.result(distinct: true)
        
    end

    def create
        @user = current_user

        if @user.creator_id == nil # && Creator.find(@user.creator_id).approved != true
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
            flash[:warn] = "Searched outfit doesn't exist"
            redirect_to root_path
        end
    end

    def destroy
        @outfit = Outfit.find(params[:id])
        authorize! :destroy, @outfit, :message => "BEWARE: you are not
        authorized to access this page"
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
