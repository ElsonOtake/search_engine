class SessionsController < ApplicationController
  def create
    @person = Person.find_by_name(session_params[:name])
    if @person
      session[:person_id] = @person.id
      redirect_to person_articles_path(@person.id)
    else
      flash[:notice] = 'Login is invalid!'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:person_id] = nil
    flash[:notice] = 'You have been signed out!'
    redirect_to new_session_path
  end

  private

  def session_params
    params.permit(:name)
  end
end
