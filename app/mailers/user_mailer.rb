class UserMailer < ActionMailer::Base
  default from: "InterviewScheduler <ischeduler33@gmail.com>"


  # This file created with help from the Action Mailer Basics
  # documentation.
  def recruiter_send(recruiter, candidate, message)
    @recruiter = recruiter
    @candidate = candidate
    @message = message
    email_with_name = "#{@candidate.name} <#{@candidate.email}>"
    if @recruiter.company != ""
      mail(to: email_with_name, subject: "New message from recruiter #{@recruiter.name} of #{@recruiter.company}!")
    else
      mail(to: email_with_name, subject: "New message from recruiter #{@recruiter.name}!")
    end
  end

  def welcome_candidate(candidate)
    @candidate = candidate
    email_with_name = "#{@candidate.name} <#{@candidate.email}>"
    mail(to: email_with_name, subject: "Welcome to InterviewScheduler!")
  end

  def welcome_recruiter(recruiter)
    @recruiter = recruiter
    email_with_name = "#{@recruiter.name} <#{@recruiter.email}>"
    mail(to: email_with_name, subject: "Welcome to InterviewScheduler!")
  end

  def forgot_password(user_email, message)
      @message = message
      mail(to: user_email, subject: "RESET PASSWORD- DO NOT REPLY")
  end

end
