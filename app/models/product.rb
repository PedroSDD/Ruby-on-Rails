class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true   #validates is a method of rails that allows validate something
  validates :ptice, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true #This gives the guarentee that our title is a unique on the table
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(.gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image'
  }

  def self.latest
    Product.order(:updated_at).last
  end
end
