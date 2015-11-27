class PilkarzsController < ApplicationController
  before_action :set_pilkarz, only: [:show, :edit, :update, :destroy]
  before_action :set_druzynas, only: [:new, :edit, :update, :create]
  http_basic_authenticate_with :name => "organizator", :password => "haslo123", :except => [:index, :show]
  # GET /pilkarzs
  # GET /pilkarzs.json
  def index
    @pilkarzs = Pilkarz.all
  end

  # GET /pilkarzs/1
  # GET /pilkarzs/1.json
  def show
  end

  # GET /pilkarzs/new
  def new
    @pilkarz = Pilkarz.new
  end

  # GET /pilkarzs/1/edit
  def edit
  end

  # POST /pilkarzs
  # POST /pilkarzs.json
  def create
    @pilkarz = Pilkarz.new(pilkarz_params)

    respond_to do |format|
      if @pilkarz.save
        format.html { redirect_to @pilkarz, notice: 'Pilkarz was successfully created.' }
        format.json { render :show, status: :created, location: @pilkarz }
      else
        format.html { render :new }
        format.json { render json: @pilkarz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pilkarzs/1
  # PATCH/PUT /pilkarzs/1.json
  def update
    respond_to do |format|
      if @pilkarz.update(pilkarz_params)
        format.html { redirect_to @pilkarz, notice: 'Pilkarz was successfully updated.' }
        format.json { render :show, status: :ok, location: @pilkarz }
      else
        format.html { render :edit }
        format.json { render json: @pilkarz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pilkarzs/1
  # DELETE /pilkarzs/1.json
  def destroy
    @pilkarz.destroy
    respond_to do |format|
      format.html { redirect_to pilkarzs_url, notice: 'Pilkarz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pilkarz
      @pilkarz = Pilkarz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pilkarz_params
      params.require(:pilkarz).permit(:imie, :nazwisko, :ileGoli, :ile_zoltych_kartek, :ile_czerwonych, :druzyna_id)
    end
    
    def set_druzynas
      @druzynas = Druzyna.all.map do |druzyna|
        [ druzyna.nazwa, druzyna.id]
      end
    end
end
