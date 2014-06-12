class CreateSpreePrizes < ActiveRecord::Migration
  def change
    create_table :spree_prizes do |t|
      t.string     :title
      t.text       :description
      t.datetime   :begin_time
      t.datetime   :end_time
      t.attachment :image
      t.timestamps
    end
  end
end
