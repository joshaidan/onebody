class ToursController < ApplicationController

  # allow start/stop from a get request
  def show
    if params[:start]
      create
    elsif params[:stop]
      destroy
    else
      raise ActionController::UnknownAction, 'No action responded to show'
    end
  end

  def create
    session[:touring] = true
    expire_fragment(%r{views/people/#{@logged_in.id}_})
    redirect_to stream_path
  end
  
  def destroy
    session[:touring] = false
    expire_fragment(%r{views/people/#{@logged_in.id}_})
    redirect_back
  end

end