class ApplicationController < ActionController::Base
 
  def hello
    render html: "Welcome to Match.edu! \n Look out for something awesome in this space!"
  end
    include SessionsHelper
end
