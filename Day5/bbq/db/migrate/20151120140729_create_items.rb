class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.references :barbecue, index: true
    	t.string :name
    	t.integer :quantity
      	t.timestamps null: false
    end
  end
end
