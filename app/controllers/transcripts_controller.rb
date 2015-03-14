class TranscriptsController < ApplicationController
  # before_action :set_elective, only: [:show, :edit, :update, :destroy]

  def index
    @transcripts = Transcripts.all
    render :template => "transcripts/index"
  end

  def show
    @transcript = Transcripts.find(params[:id])
    render :template => "transcripts/show"
  end
 end