class SearchController < ApplicationController
  def index
    @search_term = params[:search_term]

    @technologies = Technology.where("name LIKE ?", "#{@search_term}%" )

    @technology_type = TechnologyType.find(2)
  end
end
