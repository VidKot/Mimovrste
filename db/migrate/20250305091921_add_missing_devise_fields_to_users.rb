class AddMissingDeviseFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    # Only add missing columns, for example:
    add_column :users, :remember_created_at, :datetime unless column_exists?(:users, :remember_created_at)
  end
end
