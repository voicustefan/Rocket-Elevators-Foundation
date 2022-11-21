require 'slack-ruby-client'
require 'slack-notifier'
require 'twilio-ruby'

class Elevator < ApplicationRecord
    belongs_to:column, class_name: 'Column', foreign_key: 'column_id', optional: true        
    
    @first = :status 
    after_update :slack

    def slack
        if status != @first then           
            begin
                notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
                notifier.ping "The Elevator #{id} with Serial Number #{serialNumber} changed status from #{status_before_last_save} to #{status}"
            rescue Exception
                pp "error with slack"
            end
        end
    end
    after_update :twilio

  def twilio
    isTechRequested
  end
  
  def isTechRequested
    if self.status == "Intervention"
    send_sms
    end
  end
    

  def send_sms
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    puts "YOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    puts account_sid
    to = '+15142366192'
    from = ENV['TWILIO_PHONE_NUMBER']
    message = @client.messages.create(
      to: to,
      from: from,
      body: "Elevator #{id} in building #{column.battery.building.id} has changed status from #{status_before_last_save} to #{status}. Technical assistance is required."
    )
    puts message.sid
  end
end
