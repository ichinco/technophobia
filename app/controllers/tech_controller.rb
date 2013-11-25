class TechController < ApplicationController
  include TechHelper

  def show
    @technology = Technology.find(params[:id])
    @rating_summary = construct_tech_overview(@technology)
  end

  def index
    @technology_type_name = params[:search][:technology_type]
    @technology_type = TechnologyType.find_by_name(@technology_type_name)
    @technologies = Technology.where(:technology_type_id => @technology_type.id)
    #@technologies = Technology.all
  end
end
