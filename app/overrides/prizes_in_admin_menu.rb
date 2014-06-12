Deface::Override.new(
  virtual_path: 'spree/admin/shared/_menu',
  insert_bottom: "[data-hook='admin_tabs']",
  text: "<li class='tab-with-icon'><%= link_to 'PRIZES', admin_prizes_path, class: 'fa fa-beer icon_link with-tip' %></li>",
  name: 'prizes_in_admin_menu'
)
