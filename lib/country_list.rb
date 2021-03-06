class CountryList

  def all
    [
      { name: "United States of America", continent: "North America" },
      { name: "Canada", continent: "North America" },
      { name: "Italy", continent: "Europe" },
      { name: "Venezuela", continent: "South America" },
      { name: "Mexico", continent: "North America" },
      { name: "South Africa", continent: "Africa" },
      { name: "Spain", continent: "Europe" },
      { name: "Colombia", continent: "South America" },
      { name: "France", continent: "Europe" },
      { name: "Kenya", continent: "Africa" },
      { name: "Argentina", continent: "South America" },
    ]
  end

  def continents
    all.map { |country| country[:continent] }.uniq.sort
  end

  # original .each method

  # def countries_for_continent(continent)
  #   countries_in_continent = []
  #   all.each do |hash|
  #     if hash[:continent] == continent
  #       countries_in_continent << hash
  #     end
  #   end
  #   countries_in_continent
  # end

  # Method using .reject

  # def countries_for_continent(continent)
  #   all.reject {|hash| hash[:continent] != continent }
  # end

  # reversed using .select

  # def countries_for_continent(continent)
  #   all.select {|hash| hash[:continent] == continent }
  # end

  # using the inject method 

  def countries_for_continent(continent)
    all.inject([]) {|memo,hash| memo.push hash if hash[:continent] == continent; memo }
  end

end