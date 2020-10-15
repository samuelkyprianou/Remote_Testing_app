class CreateAnswerOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_options do |t|
      t.string :option
      t.integer :question_id
      t.boolean :correct
      t.timestamps
    end
  end
end
