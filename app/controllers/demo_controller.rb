class DemoController < ApplicationController
  layout false

  def index
    render(:template => 'demo/hello') # or render('demo/hello')
  end

  def hello
    render('index')
  end
end
