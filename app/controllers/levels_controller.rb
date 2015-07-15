class LevelsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, :except =>  [:index]
  before_filter :check_site_access, :except =>  [:index]
  # GET /levels
  # GET /levels.json
  def index

    @levels = Level.all
    @games = Level.all.map{|level| level.game}.uniq

    @level_gallery = {}
    @games.each do |game_name|
      @level_gallery[game_name] = Level.where("game=?",game_name.to_s).to_ary
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @levels }
    end
  end


  # GET /levels/1
  # GET /levels/1.json
  def show
    @level = Level.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @level }
    end
  end

  # GET /levels/new
  # GET /levels/new.json
  def new
    @level = Level.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @level }
    end
  end

  # GET /levels/1/edit
  def edit
    @level = Level.find(params[:id])
  end

  # POST /levels
  # POST /levels.json
  def create
    @level = Level.new(params[:level])

    respond_to do |format|
      if @level.save
        format.html { redirect_to @level, notice: 'Level was successfully created.' }
        format.json { render json: @level, status: :created, location: @level }
      else
        format.html { render action: "new" }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /levels/1
  # PUT /levels/1.json
  def update
    @level = Level.find(params[:id])

    respond_to do |format|
      if @level.update_attributes(params[:level])
        format.html { redirect_to @level, notice: 'Level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    @level = Level.find(params[:id])
    @level.destroy

    respond_to do |format|
      format.html { redirect_to levels_url }
      format.json { head :no_content }
    end
  end
end

#
#class LevelsController < ApplicationController
#  respond_to :json
#
#  def index
#    respond_with Level.all
#  end
#  def show
#    respond_with Level.find(params[:id])
#  end
#  def create
#    respond_with Level.create(params[:level])
#  end
#  def update
#    respond_with Level.update(params[:id],params[:level])
#  end
#  def destroy
#    respond_with Level.destroy(params[:id])
#  end
#end
