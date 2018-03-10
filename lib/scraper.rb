require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def get_page(url_str)
    html = open(url_str)
    doc = Nokogiri::HTML(html)
    doc
  end

  def get_categories
    doc = self.get_page("https://riflepaperco.com/shop/")
    categories = doc.css('ol#products-container li.product')
    categories.map do |category|
      ["#{category.css('h4 a').text}", "#{category.css('h4 a')[0]['href']}", "#{category.css('a>img')[0].attributes['src'].value}"]
    end
  end

  # url_str = "https://riflepaperco.com/shop/home/art-prints/"
  def get_products(url_str)
    doc = self.get_page(url_str)
    products = doc.css('ol#products-container li.product')
    products.map do |product|
      name = product.css('h4 a').text.strip
      normalized_name = part_before_tab(name)

      price = product.css('em')[0].children.text.strip
      normalized_price = normalize_price(price)

      # [name, price, url, image_link]
      ["#{normalized_name}", normalized_price, "#{product.css('h4 a')[0]['href']}", "#{product.css('a>img')[0].attributes['src'].value}"]
    end
  end

  def get_all_products
    categories = get_categories()
    products = categories.map do |cat|
      cat_url = cat[1]
      cat_products = get_products(cat_url)
      cat_products
    end
    products.flatten(1)
  end

  private
  def part_before_tab(str)
    str.split("\t")[0] 
  end

  # Use this Ruby Format method to display price to 2 decimal point 
  # <%= "#{'%.2f' % product.price }" %>  instead of <%= product.price %>
  def normalize_price(str)
    str.gsub("$","").to_f
  end

end