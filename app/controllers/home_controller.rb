class HomeController < ApplicationController
  def index
    #@types = TechnologyType.all

    redirect_to technology_index_path(:technology_type_id => 2)
  end
end
