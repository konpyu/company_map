class Api::V1::StartupsController < ApplicationController
  def create
    startup = Startup.create(startup_params)
    respond_to do |format|
      format.json { render json: startup, status: 200 }
    end
  end

  def index
    startup = Startup.all
    respond_to do |format|
      format.json { render json: startup, status: 200 }
    end
  end

  def show
    startup = Startup.find(params[:id])
    respond_to do |format|
      format.json { render json: startup, status: 200 }
    end
  end

  def like
    startup = Startup.find(params[:id])
    startup.like_count += 1
    startup.save!
    respond_to do |format|
      format.json { render json: startup, status: 200 }
    end
  end

  private

  def startup_params
    params.permit(
      :name,
      :company_name,
      :address,
      :company_url,
      :description,
      :like_count,
      :logo_url,
      :employee_count,
      :found_year,
      :lat,
      :lng,
      :vlat,
      :vlng,
      :area,
      :category
    )
  end

end
