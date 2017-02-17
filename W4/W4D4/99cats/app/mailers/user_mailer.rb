class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = "localhost:3000/cats"
    mail(to: "kyumin133@gmail.com", subject: "Welcome to 99 Cats")
  end
end
