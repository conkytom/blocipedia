class SignUpMailer < ApplicationMailer
    default from: "tmconkwright@gmail.com"

    def sign_up(user)

        headers["Message-ID"]  = "<sign_up/@bloccit.example>"
        headers["In-Reply-To"] = "<sign_up/@bloccit.example>"
        headers["References"]  = "<sign_up/@bloccit.example>"

        @user = user

        mail(to: user.email, subject: "New Blocipedia User Sign Up")
    end
end
