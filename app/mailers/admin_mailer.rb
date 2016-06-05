class AdminMailer < ApplicationMailer
    default from: "admin@databurj.lums.edu.pk"
    def sample_email(user)
        @user = user
        mail(to: @user.email, subject: 'Sample Email')
    end
end
