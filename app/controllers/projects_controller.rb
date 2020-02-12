class ProjectsController < ApplicationController
    before_action :find_okr, only: [:index, :create, :new, :show, :edit, :update, :destroy]
    def index
      @okrs = Okr.all
      @projects = Project.all
    end


# GET /okrs/1
  # GET /okrs/1.json
  def show
  end

  def new
    p = Project.new
    p.okr = @okr
  end

  def create
    p = Project.new
    p.okr = @okr
  end
  

  # GET /projects/1/edit
  def edit
  end

    def find_okr
        @okr = Okr.find(params[:okr_id])
    end
end