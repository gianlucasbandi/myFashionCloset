class CaposController < ApplicationController
  before_action :authenticate_user!

  # GET /capos or /capos.json
  def index
    authorize! :read, Capo, :message => "BEWARE: you are not
        authorized to access this page"
    if Articolo.save_top_popular_articles
      @message = 'Succeed'
    else
      @message = 'Failed'
    end
    @q = Capo.ransack(params[:q])
    #@capos = Capo.all
    @capos = @q.result(distinct: true)
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capo
      @capo = Capo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def capo_params
      params.require(:capo).permit(:immagine, :nome, :descrizione)
    end       
      
end
