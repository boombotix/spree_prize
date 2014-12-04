class AddMetaDescriptionToSpreePrize < ActiveRecord::Migration
  def change
    add_column :spree_prizes, :meta_description, :string
  end
end
