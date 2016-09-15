class AddOrdemToRedes < ActiveRecord::Migration
  def change
    add_column :redes, :ordem, :integer
  end
end
