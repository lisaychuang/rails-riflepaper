# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require './lib/scraper'

SCRAPER = Scraper.new

DATA = {
  :categories_keys => ["name", "link", "img_url"],
  # :categories => [
  #     ["Art Prints", "https://riflepaperco.com/shop/home/art-prints/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/a/p/apm132-juliet-rose-00_2.jpg"],
  #     ["Wallpaper", "https://riflepaperco.com/shop/home/wallpaper/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/p/e/peonies-copper-wallpaper.jpg"], ["Candles", "https://riflepaperco.com/shop/home/candles/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/n/cndc005-jardin-de-paris-02_2.jpg"], ["Books", "https://riflepaperco.com/shop/home/books/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/p/b/pbg05-0.jpg"], ["Fabric", "https://riflepaperco.com/shop/home/fabric/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/s/csc015-rosa-violet-swatch.jpg"], ["Coasters", "https://riflepaperco.com/shop/home/coasters/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/o/coa007-lively-floral-coasters-01.jpg"], ["Recipe Boxes & Cards", "https://riflepaperco.com/shop/home/recipe-boxes-cards/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/i/citrus-floral-kitchen-recipe-box-01_4.jpg"], ["Meal Planners", "https://riflepaperco.com/shop/home/meal-planners/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/n/p/npl002-citrus-floral-01_1.jpg"], ["Market Pads", "https://riflepaperco.com/shop/home/market-pads/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/n/p/nps008-herb-garden-01_1.jpg"], ["Parties", "https://riflepaperco.com/shop/home/parties/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/l/c/lcm009-01.jpg"], ["Calendars", "https://riflepaperco.com/shop/desk/calendars/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/a/cal037-2018-appointment-00-cover_1.jpg"], ["Planners", "https://riflepaperco.com/shop/desk/planners/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/p/l/plh004-2018-coral-agenda-02.jpg"], ["Address Books", "https://riflepaperco.com/shop/desk/address-book/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/a/b/abh002-blush-addressbook-01.jpg"], ["Journals & Notebooks", "https://riflepaperco.com/shop/desk/journals/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/j/m/jmm006-mermaid-notebook-set-01.jpg"], ["Notepads", "https://riflepaperco.com/shop/desk/notepads/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/n/p/npm021-juliet-rose-01.jpg"], ["File Folders", "https://riflepaperco.com/shop/desk/file-folders/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/f/f/ffa003-shanghai-gardens-01-2.jpg"], ["Pencils", "https://riflepaperco.com/shop/desk/writing-pencils/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/b/p/bpa002-floral-01_1.jpg"], ["Phone Cases", "https://riflepaperco.com/shop/accessories/phone-cases/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/p/i/pic054-67-clear-juliet-rose-01-1_1.jpg"], ["Bags", "https://riflepaperco.com/shop/accessories/bag/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/t/t/ttb002-floral-vines-tote_1.jpg"], ["Enamel Pins", "https://riflepaperco.com/shop/accessories/enamel-pins/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/e/p/epm005-rosa-01-small_1.jpg"], ["Enamel Keychains", "https://riflepaperco.com/shop/accessories/enamel-keychains/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/e/k/ekm002-mermaid-keychain.jpg"], ["Tattoos", "https://riflepaperco.com/shop/accessories/tattoos/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/e/v/everyday-tattoo-floral-set-01.jpg"], ["Cosmetics", "https://riflepaperco.com/shop/accessories/cosmetics/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/r/o/rose-hand-cream-30ml--rifle_paper_ab_web_b.jpg"], ["Greeting Cards", "https://riflepaperco.com/shop/stationery/greeting-cards/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/b/i/birthday-girl-01-r_2.jpg"], ["Postcards", "https://riflepaperco.com/shop/stationery/postcards/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/r/i/rifle-paper-co-wildflower-postcard-01-n.jpg"], ["Writing Sets", "https://riflepaperco.com/shop/stationery/writing-sets/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/f/n/fnm004-juliet-rose-01-2.jpg"], ["Custom", "https://riflepaperco.com/shop/stationery/custom/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/s/csm009-lively-floral-accent-01.jpg"], ["Gift Wrap", "https://riflepaperco.com/shop/gifting/gift-wrap/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/w/p/wpm014-w-hi-01_1.jpg"], ["Gift Tags", "https://riflepaperco.com/shop/gifting/gift-tags/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/g/t/gtdm03-rosa-01.jpg"], ["Stickers & Labels", "https://riflepaperco.com/shop/gifting/stickers-labels/", "https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/r/i/rifle-paper-co-holiday-stickers-and-labels-01-n.jpg"]]
  :categories => SCRAPER.get_categories,

  :products_keys =>["name", "price", "url", "image_link"],
  :products => SCRAPER.get_all_products,
}

def make_categories
  DATA[:categories].each do |category|
    new_cat = Category.new
    category.each_with_index do |attribute, i|
      new_cat.send(DATA[:categories_keys][i] + "=", attribute)
    end
    new_cat.save
  end
end

def make_products
    DATA[:products].each do |product|
      new_product = Product.new
      product.each_with_index do |attribute, i|
        new_product.send(DATA[:products_keys][i] + "=", attribute)
      end
      new_product.save
    end
end

make_categories
make_products
