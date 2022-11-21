require 'aws-sdk-polly'

class PollyController < ApplicationController

    def index

        puts "-------------"

        client = Aws::Polly::Client.new(
            region: 'ca-central-1',
            credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
        )

        elevators = Elevator.count
        
        buildings = Building.count

        customers = Customer.count

        quotes = Quote.count

        leads = Lead.count

        batteries = Battery.count

        puts client
        resp = client.synthesize_speech({
        output_format: 'mp3', 
        text: 
        "Greetings. There are currently #{elevators} elevators
        deployed, in the #{buildings} buildings, of your #{customers} customers. Currently, #{Elevator.where(status: "Intervention").count} are not in Running Status and are being serviced. You currently have #{quotes} quotes 
        awaiting processing. You currently have #{leads} leads in your contact requests. #{batteries} batteries are deployed accross #{Address.where(entity: "building").distinct.count(:city)} cities",
        voice_id: 'Salli', 
        text_type: "text", 
        sample_rate: "16000",
        })

        
        IO.copy_stream(resp.audio_stream, "app/assets/audio/AWSPolly.mp3") 

    end
end
