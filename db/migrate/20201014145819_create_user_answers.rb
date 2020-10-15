class CreateUserAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_answers do |t|
      t.integer :answer_option_id
      t.integer :user_id

      t.timestamps
    end
  end
end
