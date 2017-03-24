Feature: Login feature

  Scenario: Empty email should fail
    Given Login screen
    When I submit
    Then I see "Vui lòng nhập vào email"

  Scenario: Invalid email should fail
    Given Login screen
    When I enter email "giang"
    And I submit
    Then I see "Vui lòng nhập e-mail hợp lệ"

  Scenario: Empty password should fail
    Given Login screen
    When I enter email "giang.nguyen@tiki.vn"
    And I submit
    Then I see "Xin vui lòng nhập vào mật khẩu"

  Scenario: Email & password not matched should fail
    Given Login screen
    When I enter email "giang.nguyen@tiki.vn"
    And I enter password "12345"
    And I submit
    Then I see "Email hoặc mật khẩu không đúng"

  Scenario: Valid email & password should success
    Given Login screen
    When I enter email "giang@tiki.vn"
    And I enter password "123456"
    And I submit
    Then I see Login screen exit
    And I see "giang@tiki.vn"