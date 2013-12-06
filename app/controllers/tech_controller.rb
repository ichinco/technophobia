class TechController < ApplicationController
  include TechHelper

  def show
    @technology = Technology.find(params[:id])
    @rating_summary = construct_tech_overview(@technology)
  end

  def index
    @technology_type_id = params[:technology_type_id]
    @technology_type = TechnologyType.find(@technology_type_id)
    @technologies = Technology.where(:technology_type_id => @technology_type.id)
    #@technologies = Technology.all
  end
end
