module GamesHelper
  def test_method(text)
    if text.length > 180
      "#{text[0...180]}..."
    else
      text
    end
  end
end
