class CreateFrasePnls < ActiveRecord::Migration[5.2]
  def change
    create_table :frase_pnls do |t|
      t.string :frase

      t.timestamps
    end
  end
end
