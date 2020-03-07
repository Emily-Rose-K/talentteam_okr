class OkrsController < ApplicationController
  before_action :set_okr, only: [:update, :destroy, :show, :edit]

  def index
    @okrs = Okr.all
    @projects = Project.all
    @milestones= Milestone.all
    @assignees = Assignee.all
  end
  
  def new
    @okr = Okr.new
  end

  def create
    @okr = Okr.new(okr_params)
    respond_to do |format|
      if @okr.save
        format.pdf { render text: 'hello' }
        format.html { redirect_to okrs_path, notice: 'OKR was successfully created.' }
        format.json { render :show, status: :created, location: @okr }
      else
        format.html { render :new }
        format.json { render json: @okr.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @okr.update(okr_params)
        format.html { redirect_to okrs_path, notice: 'OKR was successfully updated.' }
        format.json { render :show, status: :ok, location: @okr }
      else
        format.html { render :edit }
        format.json { render json: @okr.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @okr.destroy 

    respond_to do |format|
      format.html { redirect_to okrs_url, notice: 'OKR was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

  def set_okr
    @okr = Okr.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def okr_params
    params.require(:okr).permit(:objective, :key_results, :owner, :assignee_id)
  end
end
