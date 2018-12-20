class BandsController < ApplicationController

  def new
    @band = Band.new
    render :new
  end
  
  def create
    @band = Band.new(band_params)
    if @band.save
      render :index
    else
      flash.now[:errors] = @band.errors.full_messages, status: 422
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def index
    @bands = Band.all
    render :index
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      render :show
    else
      flash.now[:errors] = @band.errors.full_messages, status: 422
      render :edit
    end

    def edit
      render :edit
    end

    def destroy
      @band = Band.find(params[:id])
      @band.destroy
      render @band
    end
  end
end