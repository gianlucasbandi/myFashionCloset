class GuardarobasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_guardaroba, only: %i[ show destroy ]

  # GET /guardarobas or /guardarobas.json
  def index
   @guardarobas = Guardaroba.where(user_id: current_user.id)
  end

  # GET /guardarobas/1 or /guardarobas/1.json
  def show
  end

  # POST /guardarobas or /guardarobas.json
  def create
    Wardrobe.add_to_wardrobe(Capo.find(params[:id]), current_user.id)
  end

  # DELETE /guardarobas/1 or /guardarobas/1.json
  def destroy
    @guardaroba.destroy

    respond_to do |format|
      format.html { redirect_to guardarobas_url, success: "Guardaroba was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guardaroba
      @guardaroba = Guardaroba.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guardaroba_params
      params.require(:guardaroba).permit(:user_id, :immagine_capo, :nome_capo)
    end
end
