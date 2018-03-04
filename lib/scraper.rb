require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  @@categories = []

  def get_page
    html = open("https://riflepaperco.com/shop/")
    doc = Nokogiri::HTML(html)
    doc
  end

  def get_categories
    doc = self.get_page
    categories = doc.css('ol#products-container li.product')
    categories.each do |category|
      #   details = {name: category.css('h4 a').text,
      #             link: category.css('h4 a')[0]['href'],
      #             img_link: category.css('a>img')[0].attributes['src'].value}
      details = ["#{category.css('h4 a').text}", "#{category.css('h4 a')[0]['href']}", "#{category.css('a>img')[0].attributes['src'].value}"]
      @@categories.push(details)
    end
    @@categories
  end
end

# [{:name=>"Art Prints", :link=>"https://riflepaperco.com/shop/home/art-prints/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/a/p/apm132-juliet-rose-00_2.jpg"},
#  {:name=>"Wallpaper", :link=>"https://riflepaperco.com/shop/home/wallpaper/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/p/e/peonies-copper-wallpaper.jpg"},
#  {:name=>"Candles", :link=>"https://riflepaperco.com/shop/home/candles/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/n/cndc005-jardin-de-paris-02_2.jpg"},
#  {:name=>"Books", :link=>"https://riflepaperco.com/shop/home/books/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/p/b/pbg05-0.jpg"},
#  {:name=>"Fabric", :link=>"https://riflepaperco.com/shop/home/fabric/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/s/csc015-rosa-violet-swatch.jpg"},
#  {:name=>"Coasters", :link=>"https://riflepaperco.com/shop/home/coasters/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/o/coa007-lively-floral-coasters-01.jpg"},
#  {:name=>"Recipe Boxes & Cards", :link=>"https://riflepaperco.com/shop/home/recipe-boxes-cards/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/i/citrus-floral-kitchen-recipe-box-01_4.jpg"},
#  {:name=>"Meal Planners", :link=>"https://riflepaperco.com/shop/home/meal-planners/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/n/p/npl002-citrus-floral-01_1.jpg"},
#  {:name=>"MarketPads", :link=>"https://riflepaperco.com/shop/home/market-pads/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/n/p/nps008-herb-garden-01_1.jpg"},
#  {:name=>"Parties", :link=>"https://riflepaperco.com/shop/home/parties/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/l/c/lcm009-01.jpg"},
#  {:name=>"Calendars", :link=>"https://riflepaperco.com/shop/desk/calendars/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/a/cal037-2018-appointment-00-cover_1.jpg"},
#  {:name=>"Planners", :link=>"https://riflepaperco.com/shop/desk/planners/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/p/l/plh004-2018-coral-agenda-02.jpg"},
#  {:name=>"Address Books", :link=>"https://riflepaperco.com/shop/desk/address-book/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/a/b/abh002-blush-addressbook-01.jpg"},
#  {:name=>"Journals & Notebooks", :link=>"https://riflepaperco.com/shop/desk/journals/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/j/m/jmm006-mermaid-notebook-set-01.jpg"},
#  {:name=>"Notepads", :link=>"https://riflepaperco.com/shop/desk/notepads/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/n/p/npm021-juliet-rose-01.jpg"},
#  {:name=>"File Folders", :link=>"https://riflepaperco.com/shop/desk/file-folders/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/f/f/ffa003-shanghai-gardens-01-2.jpg"},
#  {:name=>"Pencils", :link=>"https://riflepaperco.com/shop/desk/writing-pencils/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/b/p/bpa002-floral-01_1.jpg"},
#  {:name=>"Phone Cases", :link=>"https://riflepaperco.com/shop/accessories/phone-cases/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/p/i/pic054-67-clear-juliet-rose-01-1_1.jpg"},
#  {:name=>"Bags", :link=>"https://riflepaperco.com/shop/accessories/bag/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/t/t/ttb002-floral-vines-tote_1.jpg"},
#  {:name=>"Enamel Pins", :link=>"https://riflepaperco.com/shop/accessories/enamel-pins/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/e/p/epm005-rosa-01-small_1.jpg"},
#  {:name=>"Enamel Keychains", :link=>"https://riflepaperco.com/shop/accessories/enamel-keychains/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/e/k/ekm002-mermaid-keychain.jpg"},
#  {:name=>"Tattoos", :link=>"https://riflepaperco.com/shop/accessories/tattoos/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/e/v/everyday-tattoo-floral-set-01.jpg"},
#  {:name=>"Cosmetics", :link=>"https://riflepaperco.com/shop/accessories/cosmetics/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/r/o/rose-hand-cream-30ml--rifle_paper_ab_web_b.jpg"},
#  {:name=>"Greeting Cards", :link=>"https://riflepaperco.com/shop/stationery/greeting-cards/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/b/i/birthday-girl-01-r_2.jpg"},
#  {:name=>"Postcards", :link=>"https://riflepaperco.com/shop/stationery/postcards/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/r/i/rifle-paper-co-wildflower-postcard-01-n.jpg"},
#  {:name=>"Writing Sets", :link=>"https://riflepaperco.com/shop/stationery/writing-sets/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/f/n/fnm004-juliet-rose-01-2.jpg"},
#  {:name=>"Custom", :link=>"https://riflepaperco.com/shop/stationery/custom/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/c/s/csm009-lively-floral-accent-01.jpg"},
#  {:name=>"Gift Wrap", :link=>"https://riflepaperco.com/shop/gifting/gift-wrap/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/w/p/wpm014-w-hi-01_1.jpg"},
#  {:name=>"Gift Tags", :link=>"https://riflepaperco.com/shop/gifting/gift-tags/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/g/t/gtdm03-rosa-01.jpg"},
#  {:name=>"Stickers & Labels", :link=>"https://riflepaperco.com/shop/gifting/stickers-labels/", :img_link=>"https://m.riflepaperco.com/media/catalog/product/cache/1/thumbnail/432x476/fb193eecb19491ee2d70d1d38e002e96/r/i/rifle-paper-co-holiday-stickers-and-labels-01-n.jpg"}]
