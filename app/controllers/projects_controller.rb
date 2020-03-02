class ProjectsController < ApplicationController
before_action :find_okr
before_action :find_project, except: [:new, :create]

  def index
    @okrs = Okr.all
    @projects = Project.all
    @milestones = Milestone.all
    @assignees = Assignee.all
  end

  def new
    @project = Project.new
  end
  
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

  def destroy
    @project.destroy 
    respond_to do |format|
      format.html { redirect_to okrs_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to okrs_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  def completed_milestones
    project.milestones.where(is_done: true).count 
   end

  def find_okr
      @okr = Okr.find(params[:okr_id])
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def destroy_milestones
    self.milestones.destroy_all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :due_date, :owner)
  end
  
end