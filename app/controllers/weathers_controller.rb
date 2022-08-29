# frozen_string_literal: true

class WeathersController < ApplicationController
  before_action :create_last_history_service, only: %i[historical historical_max historical_min historical_avg]

  def current
    render json: OutputService::CurrentTempService.new(Weather.last).result
  end

  def historical
    render json: @last_history_service.result('all_history')
  end

  def historical_max
    render json: @last_history_service.result('max_temp')
  end

  def historical_min
    render json: @last_history_service.result('min_temp')
  end

  def historical_avg
    render json: @last_history_service.result('avg_temp')
  end

  def by_time
    render json: OutputService::TempByTimeService.new(Weather.all, params[:date_time]).result
  end

  private

  def create_last_history_service
    @last_history_service = OutputService::CurrentHistoricalTempService.new(Weather.last(24))
  end
end
