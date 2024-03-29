class CreatorsController < ApplicationController
  #before_action :set_creator, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show]
  skip_before_action :verify_authenticity_token


  # GET /creators or /creators.json
  def index
    @creators = Creator.all
  end

  # GET /creators/1 or /creators/1.json
  def show
    begin
      @creator = Creator.find(params[:id])

      if @creator.approved == nil
        flash[:alert] = "Searched creator doesn't exist"
        redirect_to root_path
      end

      if(current_user!=nil)
        @current_user = current_user
        @user = User.where("creator_id = ?",params[:id])[0]   #Getting creator' info
        @outfits = @creator.outfits.order(created_at: :desc);      #Getting creator' outfit
        @followed = !(@creator.follows.where("user_id = ?",@current_user.id).empty?)
      
      else
        @user = User.where("creator_id = ?",params[:id])[0]   #Getting creator' info
        @outfits = @creator.outfits.order(created_at: :desc);      #Getting creator' outfit
      end

    rescue => exception   #Doesn't exits
      flash[:alert] = "Searched creator doesn't exist"
      redirect_to root_path
    end
    
  end

  # GET /creators/new
  def new
    @user = current_user
    if @user.creat == false #Bisogna introdurre una gestione più accurata (Richiesta rifiutata,richiesta accettata etc)
      flash[:alert] = "Your request was refused because the description is not exhaustive or it does not comply with the site policy"
      redirect_to root_path
    elsif @user.creator_id != nil   #Bisogna introdurre una gestione più accurata (Richiesta rifiutata,richiesta accettata etc)
      flash[:alert] = "A request to become a creator has already been sent"
      redirect_to root_path
    else
      @creator = Creator.new
    end
  end

  # GET /creators/1/edit
  def edit
  end

  # POST /creators or /creators.json
  def create
    @creator = Creator.new(creator_params)
    @user = current_user

    @creator.approved = nil  #Admin must accept/deny(true/false) new creators
    @creator.user_id = @user.id
    
    if @creator.save
      flash[:success] = "Request sent correctly"
      @user.update(creator_id: @creator.id)
      #format.html { redirect_to creator_url(@creator), notice: "Creator was successfully created." }
      #format.json { render :show, status: :created, location: @creator }
    else
      flash[:alert] = "Something gone wrong!"
      #format.html { render :new, status: :unprocessable_entity }
      #format.json { render json: @creator.errors, status: :unprocessable_entity }
    end
    redirect_to root_path
    
  end

  # PATCH/PUT /creators/1 or /creators/1.json
  def update
    respond_to do |format|
      if @creator.update(creator_params)
        format.html { redirect_to creator_url(@creator), notice: "Creator was successfully updated." }
        format.json { render :show, status: :ok, location: @creator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creators/1 or /creators/1.json
  def destroy
    @creator = Creator.find(params[:id])
    authorize! :destroy, @creator, :message => "BEWARE: you are not
    authorized to delete creators"

    if @creator.present?
        @creator.destroy
    end

    @user = User.where(id: @creator.user_id)[0]
    @user.creator_id = nil;
    @user.creat = false;
    @user.save!

    respond_to do |format|
      format.html { redirect_to admin_url, success: "Creator was successfully deleted." }
      format.json { head :no_content }
    end
  end

  #A user follow a new creator
  def follow
    @creator = Creator.find(params[:id])
    @user = current_user
    @follow = Follow.new(user_id: @user.id,creator_id: @creator.id)
    @follow.save!
  end

  #user unfollow a creator
  def unfollow
    @creator = Creator.find(params[:id])
    @user = current_user
    Follow.where("creator_id = ? and user_id = ?",@creator.id,@user.id).destroy_all
  end

  #user reported a creator
  def report
    @creator = Creator.find(params[:id])
    @user = current_user
    @report = Report.new(about: params[:about],description: params[:description],user_id: @user.id, creator_id: @creator.id)
    if @report.save!    #Da rivedere
      "ok"
    else
      "ko"
    end

  end

  #POST accettazione creator da parte dell'admin
  def accept
    @creator = Creator.find(params[:id])
    @creator.approved = true
    @creator.save!

    @user = User.where(id: @creator.user_id)[0]
    @user.creat = true
    @user.save!

    respond_to do |format|
      format.html { redirect_to admin_url, success: "Creator was successfully accepted." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creator
      @creator = Creator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def creator_params
      params.require(:creator).permit(:firstName, :lastName, :birthday, :gender, :styleDesc, :approved)
    end


end
