class TechnologyPropertyController < ApplicationController
  def index
    @technology_type = TechnologyType.find(params[:technology_type_id])
    @properties = TechnologyProperty.where(:technology_type_id => @technology_type.id)
    @technologies = Technology.all
  end
end
