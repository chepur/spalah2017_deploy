class BroadcastsController < ApplicationController
  def new
    @form = BroadcastForm.new
  end

  def create
    @form = BroadcastForm.new params[:broadcast]

    if @form.valid?
      redirect_to new_broadcast_path
    else
      render :new
    end

  end

end
