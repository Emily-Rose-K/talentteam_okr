class AssigneesController < ApplicationController

  def new
   @assignee = Assignee.new
  end   

  def create
    @assignee = Assignee.new(assignee_params)
    respond_to do |format|
      if @assignee.save
        format.pdf { render text: 'hello' }
        format.html { redirect_to okrs_path, notice: 'Welcome to the team!' }
        format.json { render :show, status: :created, location: @assignee}
      else
        format.html { render :new }
        format.json { render json: @assignee.errors, status: :unprocessable_entity }
      end
    end
  end

  def assignee_params
    params.require(:assignee).permit(:first_name, :last_name, :birthday, :nickname, :email)
  end

  def set_assignee
    @assignee = Assignee.find(params[:id])
  end
end