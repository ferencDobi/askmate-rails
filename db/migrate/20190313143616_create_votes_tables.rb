class CreateVotesTables < ActiveRecord::Migration[5.2]
  def change
    create_table :question_votes do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.column :vote, :integer, default: 0
      t.index %i[user_id question_id], unique: true
    end

    create_table :answer_votes do |t|
      t.belongs_to :user
      t.belongs_to :answer
      t.column :vote, :integer, default: 0
      t.index %i[user_id answer_id], unique: true
    end
  end
end