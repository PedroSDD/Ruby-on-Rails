class Cart < ActiveRecord::Base
  has_may: line_items, dependent: :destroy
end
