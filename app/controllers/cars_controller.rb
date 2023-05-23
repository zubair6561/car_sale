class CarsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cars = if params[:query]&.values&.compact_blank&.present?
              PgSearch.multisearch(params[:query].values).map(&:searchable)
            else
              Car.all
            end
  end
end
