class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :userId
      t.string :password
      t.string :email
      t.string :name
      t.string :email
      t.string :address
      t.string :address1
      t.string :role

      t.timestamps
    end
  end
end
