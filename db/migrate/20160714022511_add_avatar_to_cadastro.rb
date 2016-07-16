class AddAvatarToCadastro < ActiveRecord::Migration
  def change
    add_column :cadastros, :avatar, :string
  end
end
