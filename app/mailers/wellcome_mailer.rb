class WellcomeMailer < ApplicationMailer
    default from: "usmanjaveid.185203@gmail.com"
    
    def wellcome_our_website(user)
        @user = user
        mail(to: user.email, subject: 'Wellcome To Project Managment App')
    end
end