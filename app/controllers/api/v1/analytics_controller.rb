class Api::V1::AnalyticsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_person
  before_action :find_analytic, only: %i[ update destroy ]

  # GET /api/v1/people/:person_id/analytics
  def index
    @analytics = @person.analytics.all
    render json: @analytics
  end

  # GET /api/v1/people/:person_id/analytics/1
  def show
    @analytic = @person.analytics.find(analytic_params[:id])
    render json: @analytic
  end

  # POST /api/v1/people/:person_id/analytics
  def create
    @analytic = @person.analytics.new(json_params)
    
    if @analytic.save
      render json: @analytic, status: :created
    else
      render json: @analytic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/people/:person_id/analytics/1
  def update
    if @analytic.update(json_params)
      render json: @analytic, status: :ok
    else
      render json: @analytic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/people/:person_id/analytics/1
  def destroy
    @analytic.destroy
  end

  private

  def find_person
    @person = Person.find_by_id(analytic_params[:person_id])
  end

  def find_analytic
    @analytic = @person.analytics.find_by_id(analytic_params[:id])
  end

  def analytic_params
    params.permit(:person_id, :id)
  end
  
  # Only allow a list of trusted Body parameters through.
  def json_params
    allowed_data = %(keyword results).freeze
    json_payload.select { |allow| allowed_data.include?(allow) }
  end
end
