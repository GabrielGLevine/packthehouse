# frozen_string_literal: true

class NewShowMailer < ApplicationMailer
  def new_show
    emails = User.pluck(:email)
    @show = params[:show]
    mail(bcc: emails, subject: 'New Show from PacktheHouse')
  end
end
