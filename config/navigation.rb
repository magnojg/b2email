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
    primary.item :ads_menu, 'Ads', ads_path

    #Workflow
    # primary.item :workflow_menu, "Workflow", nil do |sub_nav|
    #   sub_nav.item :workflow_schedules, "Agendamentos", workflow_schedules_path, :highlights_on => :subpath
    #   sub_nav.item :workflow_holidays, "Feriados", workflow_holidays_path, :highlights_on => :subpath
    #   sub_nav.item :workflow_calendar_path, "Calendário", workflow_calendar_path, :highlights_on => :subpath
    # end
  end
end
