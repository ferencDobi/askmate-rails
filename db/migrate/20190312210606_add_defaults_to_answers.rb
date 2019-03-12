class AddDefaultsToAnswers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:answers, :upvotes, 0)
  end
end
