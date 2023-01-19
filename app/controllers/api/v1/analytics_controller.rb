class Api::V1::AnalyticsController < ApplicationController
  before_action :set_analytic, only: %i[ show update destroy ]

  # GET /api/v1/analytics
  # GET /api/v1/analytics.json
  def index
    @analytics = Analytic.all
  end

  # GET /api/v1/analytics/1
  # GET /api/v1/analytics/1.json
  def show
  end

  # POST /api/v1/analytics
  # POST /api/v1/analytics.json
  def create
    @analytic = Analytic.new(analytic_params)

    if @analytic.save
      render :show, status: :created, location: @analytic
    else
      render json: @analytic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/analytics/1
  # PATCH/PUT /api/v1/analytics/1.json
  def update
    if @analytic.update(analytic_params)
      render :show, status: :ok, location: @analytic
    else
      render json: @analytic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/analytics/1
  # DELETE /api/v1/analytics/1.json
  def destroy
    @analytic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analytic
      @analytic = Analytic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def analytic_params
      params.fetch(:analytic, {})
    end
end
