class CreateFrasePnls < ActiveRecord::Migration[5.2]
  def change
    create_table :frase_pnls do |t|
      t.string :frase, null: false

      t.references :tipo_usuario, foreign_key: true, null:false

      t.timestamps
    end
  end
end
