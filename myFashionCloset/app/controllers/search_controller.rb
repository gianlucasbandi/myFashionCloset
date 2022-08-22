class SearchController < ApplicationController
    def index
        @query = User.joins(:creator).where("approved == true").ransack(params[:q])
        @creators = @query.result(distinct:true)
    end
end
