class TechnologyController < ApplicationController
  before_filter :authenticate_user!

  def new
    @type_id = params[:technology_type_id]
    @type = TechnologyType.find(@type_id)
    @properties = TechnologyProperty.where(:technology_type_id => @type_id)
  end

  def create
    @technology = Technology.new(technology_params)
    @technology_type_id = params[:technology_type_id]
    unless @technology_type_id.blank?
      @type = TechnologyType.find(@technology_type_id)
    
      if @type.blank?
        @type = TechnologyType.new
        @type[:name] = params[:technology][:technology_type]
        @type.save
      end
    
      @technology.technology_type_id = @type.id
    end

    if @technology.save
      redirect_to tech_url(@technology)
    else
      render 'new'
    end
  end

  private
    def technology_params
      params.require(:technology).permit(:name,
                                         :website)
    end
end
