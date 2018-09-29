class CreateFrasePnls < ActiveRecord::Migration[5.2]
  def change
    create_table :frase_pnls do |t|

      t.string :frase, null: false

      t.references :tipo_usuario, foreign_key: true #Si NULL entonces es para todos los tipos de usuario

    end
  end
end
