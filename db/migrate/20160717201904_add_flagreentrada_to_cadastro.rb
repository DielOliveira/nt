class AddFlagreentradaToCadastro < ActiveRecord::Migration
  def change
    add_column :cadastros, :flagreentrada, :boolean
  end
end
