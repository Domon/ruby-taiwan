# coding: utf-8
class SearchController < ApplicationController
  def index
    @topics = Topic.all
    @pages = Page.all

    @q = params[:q].present? ? params[:q] : ""

    set_seo_meta("#{t("common.search")}: #{@q}")
    drop_breadcrumb("#{t("common.search")}: #{@q}")

    render :stream => true
  end
end
