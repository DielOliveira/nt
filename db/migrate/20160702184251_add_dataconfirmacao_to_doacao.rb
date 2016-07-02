class AddDataconfirmacaoToDoacao < ActiveRecord::Migration
  def change
    add_column :doacaos, :dataconfirmacao, :datetime
  end
end
