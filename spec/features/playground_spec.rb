require 'pry'
require 'rails_helper'

RSpec.describe 'Allow me to console you...', feature: true do
  it 'was very helpful indeed', console: true do
    expect('I had a good time').to match(/good times?/)
    binding.pry
  end

  it 'typing test', typing_test: true do
    visit "https://www.razer.com/campaigns/razer-typing"
    ## while we have a green word
    selector = "span.current-word"
    while page.has_css?(selector)
    # get green word - span.current-worgr
      green_word = find(selector).text
    # type green word - input#typebox
      find("input#typebox").fill_in(with: "#{green_word} ")
    end

    binding.pry
  end


  it 'can play blackjack like a dealer', blackjack_dealer: true do
    bet_amount = 100
    # TODO
    #.   - Logging methods
    #.   - Print turn results done
    #.   - Print winnings/losses done
    #.   - Play until funds run out
    #.    - Place Bet done
    #.    - Track funds
    #.   - Consider soft 17
    #.    - ID cards (or at least ACE)
    def player_total
      find('div#playerTotal').text.to_i
    end
    def opposing_total
      element = all('div#dealerTotal', minimum: 0)&.first
      element&.text&.to_i
    end
    def configure_bet(bet_amount)
      until find('div#bet').text.to_i == bet_amount
        find('div#more').click
      end
    end
    def money
      find('span#money').text.to_i
    end
    def turn_result
      find('div#message').text
    end
    def click_hit
      find('div#hit').click
    end
    def click_stand
      find('div#stand').click
    end
    def click_deal
      find('div#deal').click
    end
    def play_as_dealer
      click_deal if deal_button_exists?
      until deal_button_exists?
        play_turn
        sleep(1)
      end
      puts "We had a score of #{player_total}"
      puts "They had a score of #{opposing_total}" unless opposing_total.nil?
      puts "Turn #{@turn_num} result: #{turn_result}"
      puts "We now have this much money: #{money}"
    end
    def deal_button_exists?
      !all('div#deal', minimum: 0).count.zero?
    end
    def handle_soft_17
      if all('div.player-cards div[data-value="11"]', minimum: 0).count.zero?
        click_stand
      else 
        click_hit  
      end 
    end 
    def play_turn
      score = player_total
      if score > 17
        click_stand
      elsif score == 17
        handle_soft_17
      else
        click_hit
      end
    end
    # Main:
    @turn_num = 1
    puts 'Starting a game of blackjack.'
    visit('https://html5blackjack.net/')
    puts "Starting with #{money}, and a bet of #{bet_amount}..."
    until money <= 0
      configure_bet(bet_amount)
      play_as_dealer
      @turn_num += 1
    end
    puts "Ran out of money after #{@turn_num - 1} turns!"
    binding.pry
  end

  it 'can search for grocery stores', grocery_search: true do

    def search_for(search_term)
      find('input#searchbar').fill_in(with: search_term)
    end


    
    visit('http://localhost:3000')
    search_for("HEB")
    binding.pry
  end
end