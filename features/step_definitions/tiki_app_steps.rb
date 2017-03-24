require 'calabash-android/calabash_steps'

BURGER_MENU_QUERY = "* contentDescription:'Navigate up'"
sign_in_button = "* text:'ĐĂNG NHẬP'"
BUTTON_SIGN_IN_QUERY = sign_in_button

def tap_burger_menu
  tap_when_element_exists(BURGER_MENU_QUERY)
end

def tap_sign_in
  tap_when_element_exists("* text:'ĐĂNG NHẬP'")
end

def search_for(text)
  tap_when_element_exists("* id:'vSearch'")
  enter_text("* id:'et_search_box'", text)
  press_user_action_button
end

def touch_item_at(index)
  touch(query("recyclerView child *")[index])
end

def open_app
  wait_for_element_exists(BURGER_MENU_QUERY, :timeout => 10)

  if element_exists("* marked:'Tôi đã hiểu'")
    tap_when_element_exists("* marked:'Tôi đã hiểu'")
  end
  if element_exists("* marked:'ĐỂ SAU'")
    tap_when_element_exists("* marked:'ĐỂ SAU'")
  end
end

# <editor-fold desc="Screens">
Given(/^Login screen$/) do
  open_app
  tap_burger_menu
  tap_sign_in
end

Given(/^Cart screen with product "([^\"]*)"$/) do |text|
  open_app
  search_for(text)
  wait_for_element_exists("* {text CONTAINS 'Nhà Giả Kim'}")
  touch_item_at(0)
  wait_for_element_exists("* marked:'Thêm vào giỏ hàng'")
  touch("* marked:'Thêm vào giỏ hàng'")
  wait_for_element_does_not_exist("* id:'product_count' text:''")
  touch("* id:'product_count' parent *")
end

# </editor-fold>

# <editor-fold desc="Actions">
Then(/^I enter email "([^\"]*)"$/) do |text|
  enter_text("* id:'etEmail'", text)
end

Then(/^I enter password "([^\"]*)"$/) do |text|
  enter_text("* id:'etPassword'", text)
end

Then(/^I submit$/) do
  if keyboard_visible?
    hide_soft_keyboard
  end
  tap_sign_in
end
# </editor-fold>

Then(/^I see Login screen exit$/) do
  wait_for_element_does_not_exist("* text:'Đăng ký'")
end