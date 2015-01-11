class Api::V1::StartupsController < ApplicationController
  def create
    startup = Startup.create(startup_params)
    respond_to do |format|
      format.json { render json: startup, status: 200 }
    end
  end

  def index
    startup = Startup.all
    startup = startup.select("id, company_name, lat, lng, like_count, logo_url") unless params[:all_column]
    startup = startup.limit(params[:limit]) if params[:limit]
    startup = startup.order(like_count: :desc) if params[:sort] == 'like_count'

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

  def update
    startup = Startup.find(params[:id])
    startup.update!(startup_params)
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
