module ApplicationHelper
  def upcase(text)
    text.upcase
  end

  def country_name(country_code)
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s]
  end

end
