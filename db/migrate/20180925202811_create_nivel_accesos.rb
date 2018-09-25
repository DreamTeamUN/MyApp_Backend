class CreateNivelAccesos < ActiveRecord::Migration[5.2]
  def change
    create_table :nivel_accesos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
