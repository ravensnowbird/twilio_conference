require_dependency "twilio_conference/application_controller"

module TwilioConference
  class ConferencesController < ApplicationController
    def create
      render text: 
      "<Response>
        <Say>Joining a conference room</Say>
        <Dial>
          <Conference>#{params[:friendly_name]}</Conference>
        </Dial>
      </Response>"
    end
  end
end
