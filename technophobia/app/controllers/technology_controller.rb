class TechnologyController < ApplicationController
  def new
  end

  def show
  end

  def create
    @technology = Technology.new(technology_params)
    if @technology.save
      redirect_to @technology
    else
      render 'new'
    end
  end

  def index
    @technologies = Technology.all

  end

  private
    def technology_params
      params.require(:technology).permit(:name,
                                         :website)
    end
end
