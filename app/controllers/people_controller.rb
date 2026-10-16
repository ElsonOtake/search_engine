class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    @person = Person.create(person_params)
    if @person.valid?
      session[:person_id] = @person.id
      redirect_to person_articles_path(@person.id)
    else
      flash[:error] = 'Error: please try to create an account again.'
      redirect_to new_session_path
    end
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end
end
