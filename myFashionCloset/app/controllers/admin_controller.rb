class AdminController < ApplicationController
    
    def index
        @creators = Creator.all
        authorize! :read, @creators, :message => "BEWARE: you are not
        authorized to access this page"

        @outfits = Outfit.all
        @reports = Report.all
    end

end