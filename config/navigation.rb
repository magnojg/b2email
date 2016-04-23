# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_id = 'main-nav'
    primary.dom_class = 'nav pull-right'
    primary.auto_highlight = true

    # home
    primary.item :root_menu, raw('<i class="icon-home icon-white"></i>'), companies_path
    primary.item :campaigns_menu, 'Campaigns', campaigns_path
    primary.item :ad_bars_menu, 'Ad Bars', ad_bars_path
  end
end
