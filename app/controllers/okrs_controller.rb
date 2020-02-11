class OkrsController < ApplicationController
  before_action :set_okr, only: [:show, :edit, :update, :destroy]


  def index
    @projects = Project.all
    @okrs = Okr.all
  end

  def show
  end

  # GET /projects/new
  def new
    @projects = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @projects = projects.new(projects_params)

    respond_to do |format|
      if @projects.save
        format.html { redirect_to @projects, notice: 'projects was successfully created.' }
        format.json { render :show, status: :created, location: @projects }
      else
        format.html { render :new }
        format.json { render json: @projects.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @projects.update(projects_params)
        format.html { redirect_to @projects, notice: 'project was successfully updated.' }
        format.json { render :show, status: :ok, location: @projects }
      else
        format.html { render :edit }
        format.json { render json: @projects.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @projects.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projects
      @projects = projects.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projects_params
      params.require(:projects).permit( :milestone, :due_date, :owner)
    end
end

 # GET /okrs
  # GET /okrs.json
  

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
    def set_okr
      @okr = Okr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def okr_params
      params.require(:okr).permit(:objective, :key_results, :project, :owner)
    end

