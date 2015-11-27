class RankingMecziesController < ApplicationController
  before_action :set_ranking_meczy, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => "organizator", :password => "haslo123", :except => [:index, :show]
  
  # GET /ranking_meczies
  # GET /ranking_meczies.json
  def index
    @ranking_meczies = RankingMeczy.all
  end

  # GET /ranking_meczies/1
  # GET /ranking_meczies/1.json
  def show
  end

  # GET /ranking_meczies/new
  def new
    @ranking_meczy = RankingMeczy.new
  end

  # GET /ranking_meczies/1/edit
  def edit
  end

  # POST /ranking_meczies
  # POST /ranking_meczies.json
  def create
    @ranking_meczy = RankingMeczy.new(ranking_meczy_params)

    respond_to do |format|
      if @ranking_meczy.save
        format.html { redirect_to @ranking_meczy, notice: 'Ranking meczy was successfully created.' }
        format.json { render :show, status: :created, location: @ranking_meczy }
      else
        format.html { render :new }
        format.json { render json: @ranking_meczy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ranking_meczies/1
  # PATCH/PUT /ranking_meczies/1.json
  def update
    respond_to do |format|
      if @ranking_meczy.update(ranking_meczy_params)
        format.html { redirect_to @ranking_meczy, notice: 'Ranking meczy was successfully updated.' }
        format.json { render :show, status: :ok, location: @ranking_meczy }
      else
        format.html { render :edit }
        format.json { render json: @ranking_meczy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ranking_meczies/1
  # DELETE /ranking_meczies/1.json
  def destroy
    @ranking_meczy.destroy
    respond_to do |format|
      format.html { redirect_to ranking_meczies_url, notice: 'Ranking meczy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ranking_meczy
      @ranking_meczy = RankingMeczy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ranking_meczy_params
      params.require(:ranking_meczy).permit(:dataMeczu)
    end
end
