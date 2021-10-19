class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.string :date
      t.string :oldranking
      t.string :noveldata

      t.timestamps
    end
  end
end
