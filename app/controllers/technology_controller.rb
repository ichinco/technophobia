class TechnologyController < ApplicationController
  include TechnologyHelper
  include StackExchangeHelper

  before_filter :authenticate_user!, only: [:new, :create]

  def new
    @type_id = params[:technology_type_id]
    @type = TechnologyType.find(@type_id)
    @technology_properties = TechnologyProperty.where(:technology_type_id => @type_id)
    @technology_technology_properties = TechnologyTechnologyProperty.where(:technology_type_id => @type_id)

    @technology = Technology.new
    @technology.technology_type=@type
    @technology_property_values = @technology_properties.map{ |property|
      @prop = TechnologyPropertyValue.new(:technology_property=>property)
    }
    @technology_technology_values = @technology_technology_properties.map { |property|
      @prop = TechnologyTechnologyValue.new(:technology_technology_property=>property)
    }
    @technology.technology_property_values = @technology_property_values
    @technology.technology_technology_values = @technology_technology_values
  end

  def create
    @technology = Technology.new(technology_params)
    @technology.name = Sanitize.clean(@technology.name)
    @technology.website = Sanitize.clean(@technology.website)

    if @technology.save
      technology_technology_params.each do |a|
        v = TechnologyTechnologyValue.new()
        v.technology_id = @technology.id
        v.value_id=a[:value]
        v.technology_technology_property_id = a[:technology_technology_property_id]
        v.save()
      end

      redirect_to technology_path(@technology)
    else
      render 'new'
    end
  end

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

    @tags = @technology.stack_exchange_tags.collect{ |tag| tag.tag }

    @stack_exchange_answers = get_all_questions_with_tag(1.month.ago, @tags)
  end

  def index
    @technology_type_id = params[:technology_type_id]
    @technology_type = TechnologyType.find(@technology_type_id)
    @key_values = TechnologyTechnologyValue.joins(:technology).where(
        :technology_technology_property_id => @technology_type.subdomain_id,
        technologies: {:technology_type_id => @technology_type_id })

    @grouped_tech = @key_values.group_by(&:value)
  end

  private
    def technology_params
      params.require(:technology).permit(:name,
                                         :website,
                                         :technology_type_id,
                                         :technology_property_values_attributes => [:technology_property_id, :value]
                                         )
    end

  private
  def technology_technology_params
    b = params[:technology][:technology_technology_values_attributes].collect do |attr|
      attr.collect do |a|
        if a.is_a? Hash
          a[:value].collect do |c|
            unless c.blank?
              {:technology_technology_property_id => a[:technology_technology_property_id], :value=> c}
            end
          end
        end
      end
    end

    b.flatten.compact
  end

end
