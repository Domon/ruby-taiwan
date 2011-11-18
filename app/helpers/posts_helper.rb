# coding: utf-8
module PostsHelper
  def post_title_tag(post, opts = {})
    return "" if post.blank?
    raw "<a href='#{post_path(post.id)}' title='#{post.title}'>#{post.title}</a>"
  end

  def post_tags_tag(post, opts = {})
    return "" if post.blank? or post.tags.blank?
    limit = 5
    tags = post.tags
    tags = tags[0..limit-1] if tags.count > limit
    raw tags.collect { |tag| "<a href='#{posts_path(:tag => tag)}' class='tag'>#{tag}</a>" }.join(", ")
  end

  STATE_STYLE = {
    :pending => 'warning',
    :approved => 'success',
    :reject => 'important'
  }
  def format_state(state_name)
    content_tag 'span', Post.human_attribute_name(state_name), :class => ['label', STATE_STYLE[state_name]]
  end
end
