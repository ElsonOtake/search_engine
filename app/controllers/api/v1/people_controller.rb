class Api::V1::PeopleController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_person, only: %i[ show update destroy ]

  # GET /api/v1/people
  def index
    @people = Person.all
    render json: @people
  end

  # GET /api/v1/people/1
  def show
    render json: @person
  end

  # POST /api/v1/people
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/people/1
  def update
    if @person.update(person_params)
      render json: @person, status: :ok
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/people/1
  def destroy
    @person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      allowed_data = %(name).freeze
      json_payload.select { |allow| allowed_data.include?(allow) }
    end
end
