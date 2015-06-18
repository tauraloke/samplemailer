class LetterMailer < ApplicationMailer
  default from: 'notifier@localhost'

  def notify_email(letter)
    @letter = letter
    unless letter.image.filename.nil?
      attachments.inline[letter.image_identifier] = File.read(letter.image.current_path)
    end
    mail(to: Rails.application.config.admin_email, subject: letter.name)
  end

  def reply_to(letter, message)
    @letter = letter
    @message = message
    mail(to: letter.email, subject: 'Reply to: '+letter.name)
  end

end
