class ApplicationController < ActionController::Base
  def json_payload
    return [] if request.raw_post.empty?
  
    HashWithIndifferentAccess.new(JSON.parse(request.raw_post))
  end
end
