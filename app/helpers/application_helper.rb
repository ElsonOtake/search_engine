# frozen_string_literal: true

module ApplicationHelper
  def logged_in?
    !!session[:person_id]
  end

  def current_person
    @current_person ||= Person.find_by_id(session[:person_id]) if !!session[:person_id]
  end
end
