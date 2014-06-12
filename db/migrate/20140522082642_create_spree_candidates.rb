class CreateSpreeCandidates < ActiveRecord::Migration
  def change
    create_table :spree_candidates do |t|
      t.string    :name
      t.string    :email
      t.string    :city
      t.string    :state
      t.references :winable, polymorphic: true
      t.timestamps
    end
    add_index :spree_candidates, :email
  end
end
