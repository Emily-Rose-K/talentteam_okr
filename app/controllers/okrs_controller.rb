class OkrsController < ApplicationController
  before_action :set_okr, only: [:show, :edit, :update, :destroy]
  def index
    @okrs = Okr.all
    @projects = Project.all
  end
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  

  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = project.new(projects_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'projects was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(projects_params)
        format.html { redirect_to @project, notice: 'project was successfully updated.' }
        format.json { render :show, status: :ok, location: @projects }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  # GET /okrs/1
  # GET /okrs/1.json
  def show
  end

  # GET /okrs/new
  def new
    @okr = Okr.new
  end

  # GET /okrs/1/edit
  def edit
  end

  # POST /okrs
  # POST /okrs.json
  def create
    @okr = Okr.new(okr_params)

    respond_to do |format|
      if @okr.save
        format.html { redirect_to @okr, notice: 'OKR was successfully created.' }
        format.json { render :show, status: :created, location: @okr }
      else
        format.html { render :new }
        format.json { render json: @okr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /okrs/1
  # PATCH/PUT /okrs/1.json
  def update
    respond_to do |format|
      if @okr.update(okr_params)
        format.html { redirect_to @okr, notice: 'OKR was successfully updated.' }
        format.json { render :show, status: :ok, location: @okr }
      else
        format.html { render :edit }
        format.json { render json: @okr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /okrs/1
  # DELETE /okrs/1.json
  def destroy
    @okr.destroy
    respond_to do |format|
      format.html { redirect_to okrs_url, notice: 'OKR was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit( :milestone, :due_date, :owner)
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_okr
      @okr = Okr.find(params[:id])
    end
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def okr_params
      params.require(:okr).permit(:objective, :key_results, :project, :owner)
    end
  end
end