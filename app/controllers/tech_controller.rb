class TechController < ApplicationController
  def show
    @technology = Technology.find(params[:id])
  end

  def index
    @technology_type_name = params[:search][:technology_type]
    @technology_type = TechnologyType.find_by_name(@technology_type_name)
    @technologies = Technology.where(:technology_type_id => @technology_type.id)
    #@technologies = Technology.all
  end
end
