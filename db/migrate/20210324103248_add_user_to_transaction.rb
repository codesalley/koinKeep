# frozen_string_literal: true

class AddUserToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :user, null: false, foreign_key: true
  end
end
