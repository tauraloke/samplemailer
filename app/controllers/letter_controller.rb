class LetterController < ApplicationController
  def index
    @letter = Letter.new
  end

  def create
    @letter = Letter.new params.require(:letter).permit(:message, :image, :name, :email)
    @letter.save
    if @letter.errors.any?
      render :index
    else
      redirect_to action: :success
      return false
    end
  end
  
  def success
  end

end
