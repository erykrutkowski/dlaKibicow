class MeczsController < ApplicationController
  before_action :set_mecz, only: [:show, :edit, :update, :destroy]
  before_action :set_druzynas, only: [:new, :edit, :update, :create]
  http_basic_authenticate_with :name => "organizator", :password => "haslo123", :except => [:index, :show]

  # GET /meczs
  # GET /meczs.json
  def index
    @meczs = Mecz.all
  end

  # GET /meczs/1
  # GET /meczs/1.json
  def show
  end

  # GET /meczs/new
  def new
    @mecz = Mecz.new
  end

  # GET /meczs/1/edit
  def edit
  end

  # POST /meczs
  # POST /meczs.json
  def create
    @mecz = Mecz.new(mecz_params)

    respond_to do |format|
      if @mecz.save
        format.html { redirect_to @mecz, notice: 'Mecz was successfully created.' }
        format.json { render :show, status: :created, location: @mecz }
      else
        format.html { render :new }
        format.json { render json: @mecz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meczs/1
  # PATCH/PUT /meczs/1.json
  def update
    respond_to do |format|
      if @mecz.update(mecz_params)
        format.html { redirect_to @mecz, notice: 'Mecz was successfully updated.' }
        format.json { render :show, status: :ok, location: @mecz }
      else
        format.html { render :edit }
        format.json { render json: @mecz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meczs/1
  # DELETE /meczs/1.json
  def destroy
    @mecz.destroy
    respond_to do |format|
      format.html { redirect_to meczs_url, notice: 'Mecz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mecz
      @mecz = Mecz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mecz_params
      params.require(:mecz).permit(:gospodarz_id, :gosc_id, :punkty_gospodarzy, :punkty_gosci)
    end
    
    def set_druzynas
      @druzynas = Druzyna.all.map do |druzyna|
        [ druzyna.nazwa, druzyna.id]
      end
    end
    
end

