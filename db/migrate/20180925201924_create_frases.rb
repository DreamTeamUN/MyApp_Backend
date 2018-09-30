class CreateFrases < ActiveRecord::Migration[5.2]
  def change
    create_table :frases do |t|

      t.string :frase, null: false

      t.references :leccion , foreign_key: true, null: false

    end
  end
end
