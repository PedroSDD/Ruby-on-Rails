require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do      #The methods error or invalid are both used to validate
    product = Product.new                        #Method any checks if there is any error associated with an particular attribute
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:ptice].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(title: "My Book title",
                          description: "yyy",
                          image_url: "zzz.jpg")

    product.ptice = -1                 #Testing the price to check if its negative
    assert product.invalid?
    assert_equal ["must be greater or equal to 0.01"], product.errors[:ptice]

    product.ptice = 0                 #Testing the price to check if its 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.ptice = 1                 #Testing the price to check if its ok
    assert product.valid?

  end

  def new_product(image_url)
    Product.new(title: "My Book Title",
                description: "yyy",
                ptice: 1,
                image_url: image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
              http://a.b.c/x/y/z/fred.gif}
    bad = %w{ fred.doc fred.gif/more fred.gif.more}

    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end
  bad.each do |name|
    assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title: products(:ruby).title,
    description: "yyy",
    ptice: 1,
    image_url: "fred.gif")

    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]

  end
end
