class TechController < ApplicationController
  include TechHelper

  caches_action :show, expires_in: 15.minutes
  caches_action :index, expires_in: 1.minutes

  def show
    @technology = Technology.find(params[:id])
    @language = TechnologyType.where(:name =>"language").first
    @language_values = @technology.technology_technology_values.collect{|value|
      if value.technology_technology_property.value_type.id==@language.id
        value.value
      end
    }.compact
    @alternatives = Technology.where(:technology_type_id => @technology.technology_type_id)
    @alternatives = @alternatives.select { |alternative| alternative.id != @technology.id}
    @alternatives = @alternatives.select { |alternative|
      has_language = false
      alternative.technology_technology_values.each{ |value|
        has_language = has_language || (value.technology_technology_property.value_type.id==@language.id && @language_values.include?(value.value))
      }
      has_language
    }
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
