class TechnologyController < ApplicationController
  before_filter :authenticate_user!

  def new
    @licenses = License.all.map.map { |license| license.name }
    @type_id = params[:technology_type_id]
    @type = TechnologyType.find(@type_id)
    @technology_properties = TechnologyProperty.where(:technology_type_id => @type_id)

    @technology = Technology.new
    @technology.technology_type=@type
    @technology_property_values = @technology_properties.map{ |property|
      @prop = TechnologyPropertyValue.new(:technology_property=>property)
    }
    @technology.technology_property_values = @technology_property_values
  end

  def create
    @technology = Technology.new(technology_params)

    if @technology.save
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
                                         :technology_property_values_attributes => [:technology_property_id, :value])
    end
end
