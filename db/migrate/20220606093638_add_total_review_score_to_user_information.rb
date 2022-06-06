class AddTotalReviewScoreToUserInformation < ActiveRecord::Migration[7.0]
  def change
    add_column :user_informations, :total_review_score, :integer
  end
end
