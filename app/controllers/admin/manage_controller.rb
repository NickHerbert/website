class Admin::ManageController < ApplicationController
  # GET /levels
  # GET /levels.json
  def index
    @levels = Level.all
    @artworks = Artwork.all
    @projects = Project.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @levels }
    end
  end
end
