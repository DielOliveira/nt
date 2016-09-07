class AddContapicpayToDadosfinanceiro < ActiveRecord::Migration
  def change
    add_column :dadosfinanceiros, :contapicpay, :string
  end
end
