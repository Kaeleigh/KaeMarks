class CreateMailerUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :mailer_users do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps
    end
  end
end