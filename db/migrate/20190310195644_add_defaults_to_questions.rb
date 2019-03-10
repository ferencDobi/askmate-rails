class AddDefaultsToQuestions < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:questions, :upvotes, 0)
    change_column_default(:questions, :views, 0)
  end
end
