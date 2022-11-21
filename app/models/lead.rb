class Lead < ApplicationRecord


    # after_update :sendgrid

    # def sendgrid
    #     from = Email.new(email:'adityamenonchef@gmail.com')
    #     to = Email.new(email: contact_params[:email])
    #     subject = 'Sending with SendGrid is Fun'
    #     content = Content.new(type: 'text/plain', value: "Greetings #{@full_name}
    #     We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project #{@project_name}.
    #     A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.
    #     We’ll Talk soon
    #     The Rocket Team
    #     ")
    #     mail = Mail.new(from, subject, to, content)

    #     sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    #     response = sg.client.mail._('send').post(request_body: mail.to_json)
    #     puts response.status_code
    #     puts response.body
    #     puts response.headers
    #  end
    has_one_attached :attached_file

    def attached_file_on_disk
        ActiveStorage::Blob.service.path_for(attached_file.key)
    end
    has_one_attached :image
end
