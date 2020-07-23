class Blackjack
  include Capybara::DSL
  def initialize
    visit('https://html5blackjack.net/')
  end

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
  def play_as_dealer(turn_num)
    click_deal if deal_button_exists?
    until deal_button_exists?
      play_turn
      sleep(1)
    end
    puts "We had a score of #{player_total}"
    puts "They had a score of #{opposing_total}" unless opposing_total.nil?
    puts "Turn #{turn_num} result: #{turn_result}"
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
end