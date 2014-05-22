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
	options.keys.each do |key|
	  recipient[key] = options[key] if recipient[key].blank? && key != :recipients
	end
	@client.account.calls.create(recipient)
      end
    end
  end
end
