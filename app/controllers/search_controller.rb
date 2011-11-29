# coding: utf-8
class SearchController < ApplicationController
  def index
    @topics = Topic.all
    @pages = Page.all

    drop_breadcrumb("#{t("common.search")}")

    render :stream => true
  end
end
