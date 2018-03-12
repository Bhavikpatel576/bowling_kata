class AddDetailsToScores < ActiveRecord::Migration[5.1]
  def change
    add_column :scores, :frame, :integer
    add_column :scores, :rolls, :integer
    add_column :scores, :knocked_down_pin, :integer
    add_column :scores, :gameid, :integer
  end
end
