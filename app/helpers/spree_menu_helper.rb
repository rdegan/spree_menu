module SpreeMenuHelper
  # ritorna il link del menu
  def link(menu)
    if menu.url.blank?
      return product_path(menu.linkable) if menu.linkable.class == Spree::Product
      return seo_url(menu.linkable) if menu.linkable.class == Spree::Taxon
      return menu.linkable.slug if menu.linkable.class == Spree::Page
    else
      menu.url
    end
  end
end
