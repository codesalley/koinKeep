# frozen_string_literal: true

class AddGroupToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :group, foreign_key: true
  end
end
