class Grocery
  include Capybara::DSL
  def initialize
      visit('http://localhost:3000')
  end

  def search_for(search_term)
      find('input#searchbar').fill_in(with: search_term)
    end

    def click_result(search_result)
      all('div.pac-item').each do | google_result |
        if google_result.text.include? search_result
          google_result.click
        end
      end
    end
end