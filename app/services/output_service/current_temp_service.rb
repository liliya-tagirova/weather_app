# frozen_string_literal: true

module OutputService
  class CurrentTempService
    def initialize(weather)
      @weather = weather
    end

    def result
      {
        time: @weather.local_time.strftime('%Y-%m-%d %H:%M:%S %z'),
        temperature: @weather.temperature
      }
    end
  end
end