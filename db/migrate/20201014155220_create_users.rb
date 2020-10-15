class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.boolean :teacher
      t.integer :active_category
      t.timestamps
    end
  end
end
