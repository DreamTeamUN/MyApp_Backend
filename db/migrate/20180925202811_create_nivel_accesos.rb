class CreateNivelAccesos < ActiveRecord::Migration[5.2]
  def change
    create_table :nivel_accesos do |t|
      
      t.string :nombre, null: false

    end
  end
end
