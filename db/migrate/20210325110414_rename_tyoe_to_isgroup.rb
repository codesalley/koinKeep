# frozen_string_literal: true

class RenameTyoeToIsgroup < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :type, :is_group
    # Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
