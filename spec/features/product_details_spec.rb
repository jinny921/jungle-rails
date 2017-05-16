require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Users can navigate from the home page to the product detail page " do
    # ACT
    visit root_path
    first('article.product header').find_link('a').click
    sleep(3)
    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_css 'article.product-detail'
    # puts page.html

  end

end
