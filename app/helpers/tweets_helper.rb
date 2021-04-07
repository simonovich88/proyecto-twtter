module TweetsHelper
    def render_hashtag(content)
        content.gsub(/#\w+/) { |w| link_to w, "tweets/search/#{w.delete('#')}" }.html_safe
    end
end
