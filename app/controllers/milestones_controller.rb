class MilestonesController < ApplicationController
  before_action :find_project, except: [:complete]
  
  def index
    @okrs = Okr.all
    @projects = Project.all
    @milestones = Milestone.all
  end

  def new
    @milestone = Milestone.new
    @milestone.project = @project
  end

  def create
    @milestone.project_id = params[:project_id]
    if @milestone.save
      redirect_to okrs_path, notice: 'Milestone was successfully created.' 
    else
      render :new 
    end
  end
  
  def complete
    @milestone = Milestone.find_by_id(params[:id])
    @milestone.update_attribute(:completed_at, Time.now)
    @milestone.update_attribute(:is_done, true)
    redirect_to okrs_path, notice: "Milestone completed"
  end


  def find_project
    @project = Project.find(params[:project_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def milestone_params
    params.require(:milestone).permit(:name, :due_date)
  end
  
end
