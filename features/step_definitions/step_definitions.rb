Given(/^user see homepage$/) do
  # navigate to web amazon
  path = 'https://www.amazon.com/'
  $driver.navigate.to path
  # maximize windows
  $driver.manage.window.maximize
  # validate navbar homepage
  $driver.find_element(id: 'nav-belt')
end

When(/^user search item "([^"]*)"$/) do |keyword|
  # validate search field and input keyword
  search_field = $driver.find_element(id: 'twotabsearchtextbox')
  search_field.send_keys keyword
  # click search button
  search_btn = $driver.find_element(id: 'nav-search-submit-button')
  search_btn.click
end

Then(/^user see the search result$/) do
  # validate search list
  $driver.find_element(xpath: '//*[@cel_widget_id="MAIN-SEARCH_RESULTS-1"]')
  $driver.find_element(xpath: '//*[contains(@class, "a-dropdown-label") and (text()="Sort by:")]')
end

When(/^user select item "([^"]*)"$/) do |item|
  # validate select item
  select_item = $driver.find_element(xpath: "//*[text()='#{item}']")
  select_item.click
end

Then(/^user see detail page of item "([^"]*)"$/) do |item|
  # validate item detail page
  $driver.find_element(id: 'ppd')
  $driver.find_element(xpath: "//*[contains(text(), '#{item}') and @id='productTitle']")
end

When(/^user choose qty "([^"]*)"$/) do |qty|
  # validate click dropdown qty
  click_qty = $driver.find_element(xpath: '//span[contains(@class, "a-dropdown-label") and text()= "Qty:"]')
  click_qty.click
  # validate choose item qty
  choose_qty = $driver.find_element(xpath: "//ul[contains(@class, 'a-list-link')]/descendant::a[text()=#{qty}]")
  choose_qty.click
end

When(/^user click add to cart button$/) do
  # validate click add qty to cart
  add_cart = $driver.find_element(id: 'add-to-cart-button')
  add_cart.click
end

And(/^user click go to cart button$/) do
  # validate click button to cart page
  go_to_cart = $driver.find_element(xpath: '//span[contains(@id, "sw-gtc")]/descendant::a')
  go_to_cart.click
end

And(/^user see shopping cart page$/) do
  # validate shopping cart page
  $driver.find_element(id: 'activeCartViewForm')
  $driver.find_element(id: 'sc-subtotal-amount-activecart')
  $driver.find_element(id: 'sc-buy-box')
end

And(/^user click delete button for item "([^"]*)"$/) do |item|
  # validate remove item from cart
  click_delete = $driver.find_element(xpath: "//*[contains(@class, 'a-truncate-full a-offscreen') and text()"\
                 "= '#{item}']/../../../../../../following-sibling::*/descendant::*[@data-feature-id='delete']/*")
  click_delete.click
end

Then(/^user see item successfully removed$/) do
  # waiting for item to be removed
  sleep 2
  # validate item successfully removed
  $driver.find_element(xpath: '//*[contains(@class, "a-size-base") and text()= "was removed from Shopping Cart."]')
end

Then(/^user see shopping cart page is empty$/) do
  # validate cart item is empty
  $driver.find_element(xpath: '//*[contains(text(), "Your Amazon Cart is empty.")]')
  $driver.find_element(xpath: '//*[contains(text(), "Subtotal (0 items):")]')
  $driver.find_element(xpath: '//*[contains(text(), "$0.00")]')
end
