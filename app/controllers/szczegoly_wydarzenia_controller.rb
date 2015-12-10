class SzczegolyWydarzeniaController < ApplicationController
  before_action :set_szczegoly_wydarzenium, only: [:show, :edit, :update, :destroy]
  before_action :set_meczs, only: [:new, :edit, :update, :create]
  before_action :set_pilkarzs, only: [:new, :edit, :update, :create]
  http_basic_authenticate_with :name => "organizator", :password => "haslo123", :except => [:index, :show]

  # GET /szczegoly_wydarzenia
  # GET /szczegoly_wydarzenia.json
  def index
    @szczegoly_wydarzenia = SzczegolyWydarzenium.all
  end

  # GET /szczegoly_wydarzenia/1
  # GET /szczegoly_wydarzenia/1.json
  def show
  end

  # GET /szczegoly_wydarzenia/new
  def new
    @szczegoly_wydarzenium = SzczegolyWydarzenium.new
  end

  # GET /szczegoly_wydarzenia/1/edit
  def edit
  end

  # POST /szczegoly_wydarzenia
  # POST /szczegoly_wydarzenia.json
  def create
    
    @szczegoly_wydarzenium = SzczegolyWydarzenium.new(szczegoly_wydarzenium_params)
    
    if params[:szczegoly_wydarzenium][:ile_goli] >= "0"
          mecz = Mecz.find(params[:szczegoly_wydarzenium][:mecz_id])
          mecz.punkty_gospodarzy += params[:szczegoly_wydarzenium][:ile_goli].to_f
          mecz.save!
    end
    
    respond_to do |format|
      if @szczegoly_wydarzenium.save
        format.html { redirect_to @szczegoly_wydarzenium, notice: 'Szczegoly wydarzenium was successfully created.' }
        format.json { render :show, status: :created, location: @szczegoly_wydarzenium }
      else
        format.html { render :new }
        format.json { render json: @szczegoly_wydarzenium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /szczegoly_wydarzenia/1
  # PATCH/PUT /szczegoly_wydarzenia/1.json
  def update
    respond_to do |format|
      if @szczegoly_wydarzenium.update(szczegoly_wydarzenium_params)
        format.html { redirect_to @szczegoly_wydarzenium, notice: 'Szczegoly wydarzenium was successfully updated.' }
        format.json { render :show, status: :ok, location: @szczegoly_wydarzenium }
      else
        format.html { render :edit }
        format.json { render json: @szczegoly_wydarzenium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /szczegoly_wydarzenia/1
  # DELETE /szczegoly_wydarzenia/1.json
  def destroy
    @szczegoly_wydarzenium.destroy
    respond_to do |format|
      format.html { redirect_to szczegoly_wydarzenia_url, notice: 'Szczegoly wydarzenium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_szczegoly_wydarzenium
      @szczegoly_wydarzenium = SzczegolyWydarzenium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def szczegoly_wydarzenium_params
      params.require(:szczegoly_wydarzenium).permit(:data_wydarzenia, :ile_goli, :czerwone_kartki, :zolte_kartki, :pilkarz_id, :mecz_id)
    end
   
     def set_pilkarzs
      @pilkarzs = Pilkarz.all.map do |pilkarz|
        [ pilkarz.imie + " " + pilkarz.nazwisko, pilkarz.id]
      end
    end
    
     def set_meczs
      @meczs = Mecz.all.map do |mecz|
        [ mecz.gospodarz.nazwa + "[" + mecz.punkty_gospodarzy.to_s + "] - [" + mecz.punkty_gosci.to_s + "]" + mecz.gosc.nazwa, mecz.id ]
      end
    end
end
