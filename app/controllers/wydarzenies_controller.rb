class WydarzeniesController < ApplicationController
  before_action :set_wydarzeny, only: [:show, :edit, :update, :destroy]
  before_action :set_pilkarzs, only: [:new, :edit, :update, :create]
  before_action :set_meczs, only: [:new, :edit, :update, :create]
  http_basic_authenticate_with :name => "organizator", :password => "haslo123", :except => [:index, :show]

  # GET /wydarzenies
  # GET /wydarzenies.json
  def index
    @wydarzenies = Wydarzenie.all
  end

  # GET /wydarzenies/1
  # GET /wydarzenies/1.json
  def show
  end

  # GET /wydarzenies/new
  def new
    @wydarzeny = Wydarzenie.new
  end

  # GET /wydarzenies/1/edit
  def edit
  end

  # POST /wydarzenies
  # POST /wydarzenies.json
  def create
    @wydarzeny = Wydarzenie.new(wydarzeny_params)

    respond_to do |format|
      if @wydarzeny.save
        format.html { redirect_to @wydarzeny, notice: 'Wydarzenie was successfully created.' }
        format.json { render :show, status: :created, location: @wydarzeny }
      else
        format.html { render :new }
        format.json { render json: @wydarzeny.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wydarzenies/1
  # PATCH/PUT /wydarzenies/1.json
  def update
    respond_to do |format|
      if @wydarzeny.update(wydarzeny_params)
        format.html { redirect_to @wydarzeny, notice: 'Wydarzenie was successfully updated.' }
        format.json { render :show, status: :ok, location: @wydarzeny }
      else
        format.html { render :edit }
        format.json { render json: @wydarzeny.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wydarzenies/1
  # DELETE /wydarzenies/1.json
  def destroy
    @wydarzeny.destroy
    respond_to do |format|
      format.html { redirect_to wydarzenies_url, notice: 'Wydarzenie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wydarzeny
      @wydarzeny = Wydarzenie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wydarzeny_params
      params.require(:wydarzeny).permit(:data_meczu, :zawodnik_nazwisko, :w_ktorej_minucie_gol, :czerwona_kartka, :zolta_kartka_string, :pilkarz_id, :mecz_id)
    end
     def set_pilkarzs
      @pilkarzs = Pilkarz.all.map do |pilkarz|
        [ pilkarz.nazwisko, pilkarz.id]
      end
    end
    
     def set_meczs
      @meczs = Mecz.all.map do |mecz|
        [mecz.gosc, mecz.gospodarz, mecz.id]
      end
    end
end
