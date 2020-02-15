class MilestonesController < ApplicationController
  def index
    @okrs = Okr.all
    @projects = Project.all
    @milestones = Milestone.all
  end

  def new
    @milestone = Milestone.new
  end

  def create
    @milestone = Milestone.new(milestone_params)
    @milestone.project_id = params[:project_id]
    if @milestone.save
      redirect_to okrs_path, notice: 'Milestone was successfully created.' 
    else
      render :new 
    end
  end

  private
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def milestone_params
    params.require(:milestone).permit(:name, :due_date)
  end
  
end
