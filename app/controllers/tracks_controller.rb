class TracksController < ApplicationController

  def index
    @tracks = Track.all
    render :template => "tracks/index"
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
    @track = Track.find(params[:id])
    render :template => "tracks/show"
  end

  # GET /tracks/new
  def new
    @track = Track.new
    render :template => "tracks/new"
  end

  # GET /tracks/1/edit
  def edit
    @track = Track.find(params[:id])
    render :template => "tracks/edit"
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_path(@track.id)
    else
      render :template => "tracks/new"
    end
  end

# CSV Import Function
  def import
    begin
      Track.import(params[:file])
      redirect_to tracks_path, notice: "Tracks imported."
    rescue
      redirect_to tracks_path, notice: "Invalid CSV file format."
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to track_path
    else
      render :template => "tracks/edit"
    end
  end

  def delete
    @tracks = Track.all
    render :template => "tracks/delete"
  end

  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url }
      format.json { head :no_content }
    end
  end

   def destroy
     Track.destroy(params[:ids])

       respond_to do |format|
        format.html { redirect_to tracks_url }
        format.json { head :no_content }
       end
     end

   def destroy_multiple
      Tracks.destroy(params[:ids])

      respond_to do |format|
      format.html { redirect_to tracks_path }
      format.json { head :no_content }
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def track_params
    params.require(:track).permit!
  end
end
