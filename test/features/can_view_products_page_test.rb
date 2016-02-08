require "test_helper"

class CanViewProductsPageTest < Capybara::Rails::TestCase
  test "anyone can visit products listing page" do
    visit products_path
    assert_content page, "Products"
  end

  test "products page lists all the products" do
    visit products_path
    assert_content page, "Uncategorized"
    assert_content page, "Categorized product"
    assert_content page, "Tagged product"
  end

  test "clicking link on the product name takes to edit product page" do
    visit products_path
    click_link "Uncategorized"
    assert_content "Edit Uncategorized"
  end

  test "successfully updated product details" do
    visit products_path
    click_link "Uncategorized"
    fill_in "product_name", with: "Uncategorized modified"
    click_button "Update Product"
    assert_content "Product updated successfully."
    assert_content "Uncategorized modified"
  end
end
