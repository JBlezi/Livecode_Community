class ChangeStatusToBeStringInTickets < ActiveRecord::Migration[7.0]
  def change
    change_column :tickets, :status, :integer
  end
end
