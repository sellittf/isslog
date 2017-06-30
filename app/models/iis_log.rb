class IisLog

  def self.parse(file)
    require 'resolv'

    fields = nil
    h = {}

    File.readlines(file).each do |request|
      if request =~ /^#Fields/
        fields = request.split
        fields.shift
      end
      next if request =~ /^#/

      client_ip = request.split[fields.index 'c-ip']

      h[client_ip] ||= {number_of_requests: 0, fqdn: nil}
      h[client_ip][:fqdn] ||= begin Resolv.getname(client_ip) rescue '' end
      h[client_ip][:number_of_requests] += 1
    end

    h.sort_by {|k, v| v[:number_of_requests] }.reverse.to_h
  end

end
