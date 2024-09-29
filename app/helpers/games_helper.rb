module GamesHelper
  def test_method(text)
    if text.length > 120
      "#{text[0...120]}..."
    else
      text
    end
  end
end
