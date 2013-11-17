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

  private
    def technology_params
      params.require(:review).permit(:name,
                                     :website)
    end
end
