class HomeController < ApplicationController
  def index
    @types = TechnologyType.all
  end
end
