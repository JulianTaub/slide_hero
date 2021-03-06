require 'minitest_helper'
module SlideHero
  describe Point do
    it "wraps it's text in p tags" do
      point = Point.new("I'm a tiger")
      point.compile.must_equal "<p>I'm a tiger</p>"
    end

    it "supports animations" do
      point = Point.new("Animation", animation: true)
      point.compile.must_equal '<p class="fragment ">Animation</p>'
    end

    it "supports specific animations" do
      supported_animations = %w{grow shrink roll-in fade-out 
      highlight-red highlight-green highlight-blue}
      supported_animations.each do |animation|
        point = Point.new("Animation", animation: animation)
        point.compile.must_equal "<p class=\"fragment #{animation}\">" +
          "Animation" +
          "</p>"
      end
    end
  end
end
