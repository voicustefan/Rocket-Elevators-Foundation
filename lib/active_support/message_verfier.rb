# Path: lib/active_support/message_verfier.rb
# Compare this snippet from app/views/leads/_lead.json.jbuilder:    
# json.extract! lead, :id, :full_name, :company_name, :email, :phone, :project_name, :project_description, :department, :message, :image, :date, :created_at, :updated_at
# json.url lead_url(lead, format: :json)
verifier = ActiveSupport::MessageVerifier.new 's3Krit'

signed_message = verifier.generate 'a private message'
verifier.verified(signed_message) # => 'a private message'

signed_message = verifier.generate 'a public message'
verifier.verify(signed_message) # => 'a public message'

