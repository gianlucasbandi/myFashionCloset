class SearchController < ApplicationController
    def index
        @query = User.joins(:creator).where("approved == true").ransack(params[:q])
        @creators = @query.result(distinct:true)
    end

    #Endpoint to research a creator without page reload (ajax)
    def update
        @query = User.joins(:creator).where("approved == true").ransack(params[:q])
        @creators = @query.result(distinct:true)
        render json:  @creators;
    end

end
