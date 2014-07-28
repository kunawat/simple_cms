class DemoController < ApplicationController
	layout 'admin'
  def index
	#	render('hello')
	#redirect_to(:action => 'other_hello')
  end


  def hello
	# redirect_to("http://www.google.com")
	@array = [1,2,3,4,5]
	@id = params[:id].to_i
	@page = params[:page].to_i
	
  end
  def other_hello
	render(:text => 'helloEveryone')
  end
  def javascript
  	
  end
  def escape_output
  	
  end
  def logging
  	#render(:text=>'helloasd')
  	#render(:text=> @something.upcase)
  	@subjects = Subject.all
  	ActiveSupport::Deprecation.warn("This is a Deprecation.")
  	logger.debug("This is a debug.")
  	logger.info("This is an info")
  	logger.warn("This is a warn")
  	logger.error("This is an error")
  	logger.fatal("This is a fatal")
  	render(:text=> 'logged!')
   end
end
