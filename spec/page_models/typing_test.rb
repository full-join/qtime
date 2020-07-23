class Typing
  include Capybara::DSL
  def initialize
    visit ('https://www.razer.com/campaigns/razer-typing')
    ## while we have a green word
    selector = "span.current-word"
    while page.has_css?(selector) && !timer_expired?
    # get green word - span.current-worgr
      green_word = find(selector).text
    # type green word - input#typebox
      find("input#typebox").fill_in(with: "#{green_word} ")
    end
  end

  def timer_expired?
    find('div#timer').text == '0:00'
  end

  def timer_running?
    timer_expired? && find('div#timer').text != '1:00'
  end
end