# frozen_string_literal: true

class AnalyticsController < ApplicationController
  def index
    @person = Person.find_by_id(analytic_params[:person_id])
    @analytics = @person.analytics
                        .select('keyword, count(keyword) as search_count, avg(results) as results, max(created_at) as created_at')
                        .group('keyword')
                        .order('search_count desc, created_at desc')
  end

  private

  def analytic_params
    params.permit(:person_id)
  end
end
