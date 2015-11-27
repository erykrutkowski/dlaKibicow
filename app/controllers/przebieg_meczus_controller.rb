class PrzebiegMeczusController < ApplicationController
  before_action :set_przebieg_meczu, only: [:show, :edit, :update, :destroy]
  before_action :set_ranking_meczy, only: [:new, :edit, :update, :create]
  http_basic_authenticate_with :name => "organizator", :password => "haslo123", :except => [:index, :show]
  # GET /przebieg_meczus
  # GET /przebieg_meczus.json
  def index
    @przebieg_meczus = PrzebiegMeczu.all
  end

  # GET /przebieg_meczus/1
  # GET /przebieg_meczus/1.json
  def show
  end

  # GET /przebieg_meczus/new
  def new
    @przebieg_meczu = PrzebiegMeczu.new
  end

  # GET /przebieg_meczus/1/edit
  def edit
  end

  # POST /przebieg_meczus
  # POST /przebieg_meczus.json
  def create
    @przebieg_meczu = PrzebiegMeczu.new(przebieg_meczu_params)

    respond_to do |format|
      if @przebieg_meczu.save
        format.html { redirect_to @przebieg_meczu, notice: 'Przebieg meczu was successfully created.' }
        format.json { render :show, status: :created, location: @przebieg_meczu }
      else
        format.html { render :new }
        format.json { render json: @przebieg_meczu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /przebieg_meczus/1
  # PATCH/PUT /przebieg_meczus/1.json
  def update
    respond_to do |format|
      if @przebieg_meczu.update(przebieg_meczu_params)
        format.html { redirect_to @przebieg_meczu, notice: 'Przebieg meczu was successfully updated.' }
        format.json { render :show, status: :ok, location: @przebieg_meczu }
      else
        format.html { render :edit }
        format.json { render json: @przebieg_meczu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /przebieg_meczus/1
  # DELETE /przebieg_meczus/1.json
  def destroy
    @przebieg_meczu.destroy
    respond_to do |format|
      format.html { redirect_to przebieg_meczus_url, notice: 'Przebieg meczu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_przebieg_meczu
      @przebieg_meczu = PrzebiegMeczu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def przebieg_meczu_params
      params.require(:przebieg_meczu).permit(:data_meczu, :miejsce_meczu, :druzyna, :w_ktorej_minucie_gol, :wynik_meczu, :rankingMeczy_id)
    end
    
    def set_ranking_meczy
      @ranking_meczy = RankingMeczy.all.map do |ranking_meczy|
        #[RankingMeczy.dataMeczu, RankingMeczy.id]
      end
    end
end
