class AddDefaultToAmounts < ActiveRecord::Migration[5.1]
  def change
    add_column :amounts, :default, :integer
  end
end
