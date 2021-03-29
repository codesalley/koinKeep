# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :amount
      t.datetime :date

      t.timestamps
    end
  end
end
