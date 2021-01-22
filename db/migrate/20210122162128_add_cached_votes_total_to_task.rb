class AddCachedVotesTotalToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :cached_votes_total, :integer, default: 0
  end
end
