module ArticleHelper
  def article_title_tag(article)
    # return link_to(article.title, article.data.gist) if article.data.gist

    if article.data.canonical
      return link_to(article.title, article.data.canonical)
    else
      return link_to(article.title, article)
    end
  end

  def more_read_link_tag(article)
    # return link_to("전문 읽기", article.data.gist) if article.data.gist
    return link_to("전문 읽기", article)
  end
end
