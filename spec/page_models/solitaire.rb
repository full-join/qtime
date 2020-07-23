class Solitaire
  include Capybara::DSL
  def initialize
    visit('https://www.solitr.com/klondike-turn-one')
  end
  
end