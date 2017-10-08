class NotifierMailer < ApplicationMailer


  default :from => "Blog EC2017 <douontandatto@gmail.com>"
  def login_noti(user)
    @user = user

        mail :to => @user.email, :subject => "Sign in successfully!"
    end
end
