class MilestonesController < ApplicationController
  before_action :find_project, except: [:complete,]
  before_action :find_milestone, only: [:destroy, :update, :edit]
  
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
    @milestone = Milestone.new(milestone_params)
    @milestone.project = @project
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
  
  def edit
    @milestone = Milestone.find(params[:id])
  end

  def update
    respond_to do |format|
      if @milestone.update(milestone_params)
        format.html { redirect_to okrs_path, notice: 'Milestone was successfully updated.' }
        format.json { render :show, status: :ok, location: @milestone }
      else
        format.html { render :edit }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @milestone.destroy 
    respond_to do |format|
      format.html { redirect_to okrs_url, notice: 'Milestone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_milestone
    @milestone = Milestone.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def milestone_params
    params.require(:milestone).permit(:name, :due_date)
  end
  
end
