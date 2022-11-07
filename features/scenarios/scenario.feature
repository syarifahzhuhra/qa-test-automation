@scenario-1
Feature: Search, Add to Cart, and Remove Cart

  @search-add-remove-item
  Scenario: User can search, add to cart, and remove cart
    Given user see homepage
    When user search item "Microsoft Authorized Refurbished- HP Elite Desktop PC Computer Intel Core i5 3.1-GHz"
    Then user see the search result
    When user select item "Microsoft Authorized Refurbished- HP Elite Desktop PC Computer Intel Core i5 3.1-GHz, 8 gb Ram, 1 TB Hard Drive, DVDRW, 19 Inch LCD Monitor, Keyboard, Mouse, USB WiFi, Windows 10 (Renewed)"
    Then user see detail page of item "Microsoft Authorized Refurbished- HP Elite Desktop PC Computer Intel Core i5 3.1-GHz, 8 gb Ram, 1 TB Hard Drive, DVDRW, 19 Inch LCD Monitor, Keyboard, Mouse, USB WiFi, Windows 10 (Renewed)"
    When user choose qty "10"
    And user click add to cart button
    And user click go to cart button
    Then user see shopping cart page
    When user click delete button for item "Microsoft Authorized Refurbished- HP Elite Desktop PC Computer Intel Core i5 3.1-GHz, 8 gb Ram, 1 TB Hard Drive, DVDRW, 19 Inch LCD Monitor, Keyboard, Mouse, USB WiFi, Windows 10 (Renewed)"
    Then user see item successfully removed
    And user see shopping cart page is empty
