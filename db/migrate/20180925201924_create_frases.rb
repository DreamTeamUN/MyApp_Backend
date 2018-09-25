class CreateFrases < ActiveRecord::Migration[5.2]
  def change
    create_table :frases do |t|
      t.string :frase

      t.timestamps
    end
  end
end
