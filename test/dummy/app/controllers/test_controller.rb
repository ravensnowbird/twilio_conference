class TestController < ApplicationController
  def index
    @sid = "AC8f091025de573d34bd03351cd6f00b16"
    @token = "e878f6e92dcebe966970537150db368c"
    @client = Twilio::REST::Client.new(@sid, @token)
    @twilio_conference_client = TwilioConference::Client.new(@client, twilio_conference.conferences_create_url(:friendly_name => "Test1"))

    p @twilio_conference_client.inspect
    options = {}
    options[:from] = "+17606663417"
    options[:recipients] = []
    options[:recipients] << {:to => "+919032762521"}
    options[:recipients] << {:from => "+17606663417", 
			     :to => "+919032101479"}
    @twilio_conference_client.create_conference(options)

  end
end
