class LogsController < ApplicationController

  def index
    file = File.join(Rails.root, 'data', 'iis_logs', 'IISLog.log')
    @parsed_log = IisLog.parse file
  end

end
