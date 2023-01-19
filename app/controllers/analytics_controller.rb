class AnalyticsController < ApplicationController
  before_action :set_analytic, only: [:show]

  def index
    @person = Person.find_by_id(params[:person_id])
    @analytics = Analytic.
                   where(person_id: @person).
                   select("keyword, count(keyword) as search_count, avg(results) as results, max(created_at) as created_at").
                   group("keyword").
                   order('search_count desc, created_at desc')
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
