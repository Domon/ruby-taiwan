# coding: utf-8
class SearchController < ApplicationController
  def index
    @topics = Topic.all
    @pages = Page.all
  end
end
