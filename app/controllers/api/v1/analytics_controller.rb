class Api::V1::AnalyticsController < ApplicationController
  protect_from_forgery with: :null_session

  # GET /api/v1/analytics
  def index
    @analytics = Analytic.all
    render json: @analytics
  end

  # GET /api/v1/analytics/1
  def show
  end

  # POST /api/v1/analytics
  def create
    @analytic = Analytic.new(analytic_params)
    puts "analytic_params #{analytic_params}"
    if @analytic.save
      render json: @analytic, status: :created
    else
      render json: @analytic.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a list of trusted Body parameters through.
    def analytic_params
      allowed_data = %(person keyword results).freeze
      json_payload.select { |allow| allowed_data.include?(allow) }    end
end
