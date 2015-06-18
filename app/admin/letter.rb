ActiveAdmin.register Letter do

  show do
    attributes_table do
      row :name
      row :id
      row :email
      row :message
      row :also do |letter|
        link_to 'Reply to letter',  reply_admin_letter_path 
      end
      row :image do |letter|
        image_tag letter.image.url  unless letter.image.url.nil?
      end
    end
  end

  member_action :reply, method: :get do
    @letter = Letter.find params[:id]
  end

  member_action :send_email, method: :post do
    letter = Letter.find params[:id]
    LetterMailer.reply_to(letter, params[:message]).deliver_now
    redirect_to admin_letter_path, notice: 'Done.'
    false

  end

end
