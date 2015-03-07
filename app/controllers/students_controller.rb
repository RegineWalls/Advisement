class StudentsController < ApplicationController
  # before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
    render :template => "students/index"
  end

  def show
    @student = Student.find(params[:id])
    render :template => "students/show"
  end

  def new
    @student = Student.new
    render :template => "students/new"
  end

  def edit
    @student = Student.find(params[:id])
    render :template => "students/edit"
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to student_path(@student.id)
    else
      render :template => "students/new"
    end
  end

# CSV Import Function
  def import
    begin
      Student.import(params[:file])
      redirect_to root_url, notice: "Students imported."
    rescue
      redirect_to root_url, notice: "Invalid CSV file format."
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to student_path
    else
      render :template => "students/edit"
    end
  end

  def destroy
    Student.find(params[:id]).destroy!
    redirect_to students_path
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_student
  #     @student = Student.find(params[:id])
  #   end

    # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit!
  end
end
