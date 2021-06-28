class CreateFlashcards < ActiveRecord::Migration[6.1]
  def change
    create_table :flashcards do |t|
      t.string :term
      t.string :definition
      t.integer :user_id
      t.integer :subject_id
    end
  end
end
