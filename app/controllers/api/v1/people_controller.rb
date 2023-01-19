class Api::V1::PeopleController < ApplicationController
  before_action :set_person, only: %i[ show update destroy ]

  # GET /api/v1/people
  # GET /api/v1/people.json
  def index
    @people = Person.all
  end

  # GET /api/v1/people/1
  # GET /api/v1/people/1.json
  def show
  end

  # POST /api/v1/people
  # POST /api/v1/people.json
  def create
    @person = Person.new(person_params)

    if @person.save
      render :show, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/people/1
  # PATCH/PUT /api/v1/people/1.json
  def update
    if @person.update(person_params)
      render :show, status: :ok, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/people/1
  # DELETE /api/v1/people/1.json
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
      params.fetch(:person, {})
    end
end
