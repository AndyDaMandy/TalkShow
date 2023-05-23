class AddShowToSeasonViewings < ActiveRecord::Migration[7.0]
  def change
    add_reference :seasons, :show, index: true, foreign_key: true
  end
end
