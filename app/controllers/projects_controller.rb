class ProjectsController < ApplicationController
    before_action :set_projects, only: [:show, :edit, :update, :destroy]
  
    # GET /projects
    # GET /projects.json
    def index
      @projects = Projects.all
    end
  
    # GET /projects/1
    # GET /projects/1.json
    def show
    end
  
    # GET /projects/new
    def new
      @projects = Projects.new
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
        params.require(:projects).permit( :milestone, :due_date :owner)
      end
  end