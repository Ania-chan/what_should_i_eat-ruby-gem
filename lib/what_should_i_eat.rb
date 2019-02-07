require 'what_should_i_eat/printing'
require 'net/http'
require 'json'

module WhatShouldIEat
  def WhatShouldIEat.fresh
    result = Net::HTTP.get('www.edamam.com', '/search?type=Feeds')
    recipes = JSON.parse(result)
    recipe = recipes.first['items'].first['label']
    url = recipes.first['items'].first['url']
    Printing.print recipe, url
  end
end
