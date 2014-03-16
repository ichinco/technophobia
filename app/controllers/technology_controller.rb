class TechnologyController < ApplicationController
  before_filter :authenticate_user!

  caches_action :new

  def new
    @licenses = License.all.map.map { |license| license.name }
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

    if @technology.save
      technology_technology_params.each do |a|
        v = TechnologyTechnologyValue.new()
        v.technology_id = @technology.id
        v.value_id=a[:value]
        v.technology_technology_property_id = a[:technology_technology_property_id]
        v.save()
      end

      redirect_to tech_url(@technology)
    else
      render 'new'
    end
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
