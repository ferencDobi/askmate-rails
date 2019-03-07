class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :message
      t.string :image
      t.integer :upvotes
      t.integer :views
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
