class MilestonesController < ApplicationController
    before_action :find_project, only: [:index, :new, :show, :create, :edit, :update, :destroy]
    def index
      @okrs = Okr.all
      @projects = Project.all
      @milestones = Milestone.all
    end

     # GET /milestones/new
  def new
    @milestone = Milestone.new
  end


  def find_project
    @project = Project.find(params[:project_id])
end


  # Never trust parameters from the scary internet, only allow the white list through.
  def milestone_params
    params.require(:milestone).permit(:name, :due_date)
  end
  
end
