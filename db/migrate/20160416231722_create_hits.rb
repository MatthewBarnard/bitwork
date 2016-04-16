class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.boolean :is_hit, :default => "true"
      t.timestamps null: false
    end
  end
end
