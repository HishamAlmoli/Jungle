require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) {
    Category.create(name: "Sample Category")
  }
    subject {
      category.products.create(
        name: "Test Product", 
        price: 20,
        quantity: 1)
      }
  describe 'Validations' do
   it "product is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "product is invalid without a name" do
    subject.name = nil
    expect(subject).not_to be_valid
    expect(subject.errors.full_messages).to include "Name can't be blank"
  end
  it "product is invalid without a price" do
    # subject.price = ""
    product = Product.create(name: "New Product", quantity: 2, category: category)
    # puts product.price
    expect(product).not_to be_valid
    # puts product.errors.full_messages
    expect(product.errors.full_messages).to include "Price can't be blank"
  end
  it "product is invalid without a quantity" do
    subject.quantity = nil
    expect(subject).not_to be_valid
    expect(subject.errors.full_messages).to include "Quantity can't be blank"
  end
  it "product is invalid without a name" do
    subject.category = nil
    expect(subject).not_to be_valid
    expect(subject.errors.full_messages).to include "Category can't be blank"
end
end
end