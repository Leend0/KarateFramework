Feature: Test get endpoint

  Background: Setup the base path
    Given url 'https://reqres.in/api'
    And print '===== Background Keyword ===='

  Scenario: Get application data in JSON format
    Given path '/users?page=2'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response

  Scenario: Get application data in JSON format
    Given path '/users/2'
    When method get
    Then status 200
    And print response
    And match response ==
  """
  {
  "data": {
  "id": 2,
  "email": "janet.weaver@reqres.in",
  "first_name": "Janet",
  "last_name": "Weaver",
  "avatar": "https://reqres.in/img/faces/2-image.jpg"
  },
  "support": {
  "url": "https://reqres.in/#support-heading",
  "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
  }
  }
  """

  Scenario: Get application data in JSON format
    Given path '/users/7'
    When method get
    Then status 200
    And print response
    And match response contains deep {"data":{"first_name":"Michael"} }