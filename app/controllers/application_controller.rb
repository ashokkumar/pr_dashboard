class ApplicationController < ActionController::API
  def event_header
    request.headers['X-GitHub-Event']
  end
end
