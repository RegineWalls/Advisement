class ElectivesController < ApplicationController
  # before_action :set_elective, only: [:show, :edit, :update, :destroy]

  def index
    @electives = Elective.all
    render :template => "electives/index"
  end

  def show
    @electives = Elective.find(params[:id])
    render :template => "electives/show"
  end

  def new
    @elective = Elective.new
    render :template => "electives/new"
  end

  def edit
    @elective = Elective.find(params[:id])
    render :template => "electives/edit"
  end

  def create
    @elective = Elective.new(elective_params)

    if @elective.save
      redirect_to elective_path(@elective.id)
    else
      render :template => "electives/new"
    end
  end

  def update
    @elective = Elective.find(params[:id])

    if @elective.update(elective_params)
      redirect_to elective_path
    else
      render :template => "electives/edit"
    end
  end

  def destroy
    Elective.find(params[:id]).destroy!
    redirect_to electives_path
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_elective
  #     @elective = Elective.find(params[:id])
  #   end

    # Never trust parameters from the scary internet, only allow the white list through.
  def elective_params
    params.require(:elective).permit!
  end
end
