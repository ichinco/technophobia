class TechnologyController < ApplicationController
  def new
    @type = TechnologyType.all.map(&:name)
    @types = @type.to_json
    @tech = Technology.all.map{|t| t[:name]}
    @technologies = @tech.to_json
  end

  def show
    @technology = Technology.find(params[:id])
  end

  def create
    @technology = Technology.new(technology_params)
    @technology_type_name = params[:technology][:technology_type]
    unless @technology_type_name.blank?
      @type = TechnologyType.find_by_name(@technology_type_name)
    
      if @type.blank?
        @type = TechnologyType.new
        @type[:name] = params[:technology][:technology_type]
        @type.save
      end
    
      @technology.technology_type_id = @type.id
    end

    if @technology.save
      redirect_to @technology
    else
      render 'new'
    end
  end

  def index
    @technologies = Technology.all

  end

  private
    def technology_params
      params.require(:technology).permit(:name,
                                         :website)
    end
end
