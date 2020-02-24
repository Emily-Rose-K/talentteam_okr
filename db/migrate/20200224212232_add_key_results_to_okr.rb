class AddKeyResultsToOkr < ActiveRecord::Migration[6.0]
  def change
    add_column :okrs, :key_results, :string
  end
end
