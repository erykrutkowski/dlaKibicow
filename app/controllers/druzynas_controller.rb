class DruzynasController < ApplicationController
  before_action :set_druzyna, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => "organizator", :password => "haslo123", :except => [:index, :show]
  # GET /druzynas
  # GET /druzynas.json
  def index
    @druzynas = Druzyna.all
  end

  # GET /druzynas/1
  # GET /druzynas/1.json
  def show
  end

  # GET /druzynas/new
  def new
    @druzyna = Druzyna.new
  end

  # GET /druzynas/1/edit
  def edit
  end

  # POST /druzynas
  # POST /druzynas.json
  def create
    @druzyna = Druzyna.new(druzyna_params)

    respond_to do |format|
      if @druzyna.save
        format.html { redirect_to @druzyna, notice: 'Druzyna was successfully created.' }
        format.json { render :show, status: :created, location: @druzyna }
      else
        format.html { render :new }
        format.json { render json: @druzyna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /druzynas/1
  # PATCH/PUT /druzynas/1.json
  def update
    respond_to do |format|
      if @druzyna.update(druzyna_params)
        format.html { redirect_to @druzyna, notice: 'Druzyna was successfully updated.' }
        format.json { render :show, status: :ok, location: @druzyna }
      else
        format.html { render :edit }
        format.json { render json: @druzyna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /druzynas/1
  # DELETE /druzynas/1.json
  def destroy
    @druzyna.destroy
    respond_to do |format|
      format.html { redirect_to druzynas_url, notice: 'Druzyna was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_druzyna
      @druzyna = Druzyna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def druzyna_params
      params.require(:druzyna).permit(:nazwa, :miasto_pochodzenia, :nazwisko_trenera)
    end
end
