require "twilio_conference/engine"

module TwilioConference
  class Client
    def initialize(client, url)
      @client = client
      params = Rack::Utils.parse_query URI(url).query
      if @client.account.conferences.list(:friendly_name => params["friendly_name"]).blank?
        @url = url
      else
	raise "Conference Name - #{params["friendly_name"]} Already Used"
      end
    end

    def create_conference(options = {})
      options[:recipients].each do |recipient|
	@client.account.calls.create(to: recipient[:to], 
				    from: recipient[:from] || options[:from], 
				    url: @url)
      end
    end
  end
end
