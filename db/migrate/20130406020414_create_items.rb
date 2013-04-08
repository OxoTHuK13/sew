class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :title
    	t.text	 :body
    	t.float  :price
    	t.binary :image
      t.timestamps
    end
  end
end
