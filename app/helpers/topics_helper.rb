# coding: utf-8  
require 'rdiscount'
module TopicsHelper
  def format_topic_body(text, options = {})
    text = RDiscount.new(text).to_html
    text.gsub!(/#([\d]+)楼\s/,'#<a href="#reply\1" class="at_floor" data-floor="\1" onclick="return Topics.hightlightReply(\1)">\1楼</a> ')
    link_mention_user!(text, options[:mentioned_users]) if options[:mentioned_users]
    return sanitize(text)
  end

  def link_mention_user!(text, mentioned_users)
    logins = mentioned_users.only(:login).map(&:login)
    if logins.any?
      text.gsub!(/@(#{logins.join('|')})/,'@<a href="/users/\1" class="at_user" title="\1">\1</a> ')
    end
  end
  
  def topic_use_readed_text(state)
    case state
    when 0
      "在你读过以后还没有新变化"
    else
      "有新内容"
    end
  end
end
