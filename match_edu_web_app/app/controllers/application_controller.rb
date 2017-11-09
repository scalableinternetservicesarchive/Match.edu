class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: "Welcome to Match.edu! \n Look out for something awesome in this space!"
  end
    include SessionsHelper
end
