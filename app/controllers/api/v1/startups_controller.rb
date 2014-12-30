class Api::V1::StartupsController < ApplicationController
  def create
  end

  def index
    sample = {}
    sample[:hoge] = 1
    respond_to do |format|
      format.json { render :json => sample }
    end
  end

  def show
  end
end
