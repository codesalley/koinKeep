class AddTransactionToGroup < ActiveRecord::Migration[6.1]
  def change
    add_reference :groups, :transaction, null: false, foreign_key: true
  end
end
