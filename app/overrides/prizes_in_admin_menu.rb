Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  insert_bottom: "[data-hook='admin_tabs']",
  text: "<ul class='nav nav-sidebar'><%= tab *'Prizes', url: admin_prizes_path, icon: 'star' %></ul>",
  name: 'prizes_in_admin_menu'
)
