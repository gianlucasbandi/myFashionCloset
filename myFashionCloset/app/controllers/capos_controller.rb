class CaposController < ApplicationController
  before_action :authenticate_user!
  before_action :set_capo, only: %i[ show edit update destroy ]

  # GET /capos or /capos.json
  def index
    if Articolo.save_top_popular_articles
      @message = 'Succeed'
    else
      @message = 'Failed'
    end
    @q = Capo.ransack(params[:q])
    #@capos = Capo.all
    @capos = @q.result(distinct: true)
  end

  # GET /capos/1 or /capos/1.json
  def show
  end

  # GET /capos/new
  def new
    @capo = Capo.new
  end

  # GET /capos/1/edit
  def edit
  end

  # POST /capos or /capos.json
  def create
    @capo = Capo.new(capo_params)

    respond_to do |format|
      if @capo.save
        format.html { redirect_to capo_url(@capo), notice: "Capo was successfully created." }
        format.json { render :show, status: :created, location: @capo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @capo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capos/1 or /capos/1.json
  def update
    respond_to do |format|
      if @capo.update(capo_params)
        format.html { redirect_to capo_url(@capo), notice: "Capo was successfully updated." }
        format.json { render :show, status: :ok, location: @capo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @capo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capos/1 or /capos/1.json
  def destroy
    @capo.destroy

    respond_to do |format|
      format.html { redirect_to capos_url, notice: "Capo was successfully destroyed." }
      format.json { head :no_content }
    end
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
