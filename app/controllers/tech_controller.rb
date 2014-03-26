class TechController < ApplicationController
  include TechHelper

  def show
    @technology = Technology.find(params[:id])
    @languages = @technology.technology_technology_values.collect do |value|
      if value.technology_technology_property.display_name == "Language"
        value.value_id
      end
    end.compact
    @alternatives = Technology.joins(:technology_technology_values)
                    .where(technology_technology_values: {value_id: @languages})
                    .where(technologies: {technology_type_id: @technology.technology_type_id})
    @rating_summary = construct_tech_overview(@technology)
    @property_values = TechnologyPropertyValue.where(:technology_id => @technology.id)
    @technology_property_values = @technology.technology_technology_values.collect {|value| value.technology_technology_property}
    @technology_property_value_hash = {}
    @technology_property_values.each{|value|
      @technology_property_value_hash[value] = Array.new
    }
    @technology.technology_technology_values.each{|value|
      @technology_property_value_hash[value.technology_technology_property].push(value.value)
    }
  end

  def index
    @technology_type_id = params[:technology_type_id]
    @technology_type = TechnologyType.find(@technology_type_id)
    @technologies = Technology.where(:technology_type_id => @technology_type.id)
    #@technologies = Technology.all
  end
end
