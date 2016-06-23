class AddCpfToCadastro < ActiveRecord::Migration
  def change
    add_column :cadastros, :cpf, :string
  end
end
