class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.string :scholarity
      t.string :fone
      t.string :whatsapp
      t.string :skype
      t.string :gender
      t.string :addrress
      t.string :city
      t.string :state
      t.string :country
      t.date :date_of_birth
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
