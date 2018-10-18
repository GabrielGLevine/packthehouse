# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'shows@packthehouse.org'
  layout 'mailer'
end
