class AddColumnToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :type, :boolean, default: false
  end
end
