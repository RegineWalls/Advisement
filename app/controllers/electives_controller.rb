class ElectivesController < ApplicationController
  # before_action :set_elective, only: [:show, :edit, :update, :destroy]

  def index
    @electives = Elective.all
    render :template => "electives/index"
  end

  def show
    @elective = Elective.find(params[:id])
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

  # CSV Import Function
  def import
    begin
      Elective.import(params[:file])
      redirect_to electives_path, notice: "Electives imported."
    rescue
      redirect_to electives_path, notice: "Invalid CSV file format."
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

  def elective_params
    params.require(:elective).permit!
  end

  def delete
    @electives = Elective.all
    render :template => "electives/delete"
  end

  def select
    @electives = Elective.all
    render :template => "electives/select"
  end
end
