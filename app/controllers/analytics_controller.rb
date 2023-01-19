class AnalyticsController < ApplicationController
  before_action :set_analytic, only: [:show]

  def index
    @person = Person.find_by_id(params[:person_id])
    @analytics = Analytic.where(person_id: @person)
  end

  def show
  end

  private

  def set_analytic
    @analytic = Analytic.find(params[:id])
  end

  def analytic_params
    params.require(:person_analytic).permit(:person_id, :id)
  end
end
