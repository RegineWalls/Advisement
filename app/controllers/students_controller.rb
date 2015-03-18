class StudentsController < ApplicationController
  # before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.search(params[:search])
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
      redirect_to students_path, notice: "Students imported."
    rescue
      redirect_to students_path, notice: "Invalid CSV file format."
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

  def student_params
    params.require(:student).permit!
  end

  def advise
    @student = Student.find(params[:id])
    @electives = Elective.all
  end

  def delete
    @students = Student.all
    render :template => "students/delete"
  end

  def destroy
    Student.destroy(params[:ids])

      respond_to do |format|
       format.html { redirect_to students_url }
       format.json { head :no_content }
      end
    end

   def destroy_multiple
      Student.destroy(params[:ids])

      respond_to do |format|
      format.html { redirect_to students_path }
      format.json { head :no_content }
    end
  end

  def roster
    @students = Student.all
    render :template => "students/roster"
  end
end
