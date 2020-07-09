class LinesController < ApplicationController
  before_action: :authenticate_user!

  def create
    @line = line.new(line_params)
    @line.save
    
  end

  def line_params
  end

#use render instead of redirect

end
