class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.references :user, index: true
    	t.string :title, null: false
    	t.string :description
    	t.datetime :date, null:false
    	t.datetime :time, null:false
    	t.timestamps
    end
  end
end
