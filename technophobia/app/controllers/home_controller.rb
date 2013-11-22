class HomeController < ApplicationController
  def index
    @type = TechnologyType.all.map(&:name)
    @types = @type.to_json
    @tech = Technology.all.map{|t| t[:name]}
    @technologies = @tech.to_json
  end
end
