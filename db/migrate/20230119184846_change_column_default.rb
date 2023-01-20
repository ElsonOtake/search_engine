# frozen_string_literal: true

class ChangeColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:analytics, :results, 0)
  end
end
