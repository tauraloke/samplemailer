class LetterController < ApplicationController
  def index
    @letter = Letter.new
  end

  def create
    @letter = Letter.new params.require(:letter).permit(:message, :image, :name, :email)
    captcha_verified = verify_recaptcha(model: @letter)
    @letter.save if captcha_verified
    if @letter.errors.any? or not captcha_verified
      render :index
      return false
    else
      LetterMailer.notify_email(@letter).deliver_now
      redirect_to action: :success
      return false
    end
  end
  
  def success
  end

end
