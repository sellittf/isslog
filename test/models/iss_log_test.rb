require 'test_helper'

class IssLogTest < ActiveSupport::TestCase

  test "parsing and summarize log file" do
    file = File.join(Rails.root, 'test', 'fixtures', 'files', 'IISLog.log')
    parsed_log = IisLog.parse file

    expected_summary = {"69.64.56.47"=>{:number_of_requests=>9,
                                        :fqdn=>"usloft1400.serverprofi24.eu"},
                        "172.224.24.112"=>{:number_of_requests=>5,
                                           :fqdn=>"a172-224-24-112.deploy.static.akamaitechnologies.com"},
                        "172.224.24.114"=>{:number_of_requests=>1,
                                           :fqdn=>"a172-224-24-114.deploy.static.akamaitechnologies.com"}}

    assert parsed_log.eql? expected_summary
  end

end
