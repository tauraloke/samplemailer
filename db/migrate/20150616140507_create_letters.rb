class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :message
      t.string :name
      t.string :email
      t.string :image

      t.timestamps null: false
    end
  end
end
