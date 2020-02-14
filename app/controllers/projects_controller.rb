class ProjectsController < ApplicationController
before_action :find_okr 


# GET /projects/1
  # GET /projects/1.json
  def show
  end

# GET /projects/new
  def new
    @project = Project.new
  end
  
  # POST /projects/1
  def create
    @project = Project.new(project_params)
    @project.okr = @okr

    respond_to do |format|
      if @project.save
        format.html { redirect_to okrs_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @okr }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /projects/1/edit
  def edit
  end

  def find_okr
      @okr = Okr.find(params[:okr_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :due_date, :owner)
  end
  
end