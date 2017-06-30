class LogsController < ApplicationController

  def index
    file = File.join(Rails.root, 'data', 'iss_logs', 'IISLog.log')
    @parsed_log = IisLog.parse file
  end

end
