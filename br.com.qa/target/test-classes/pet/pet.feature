#Author: profricardo.moura@fiap.com.br

@tag
Feature: Everything about your Pets
  Descrição da feature

Background:
	Given path 'pet'

  @tag1
  Scenario: Finds Pets by status
    Given url UrlBase
    And path 'findByStatus'
    And param status = 'available'
    When method GET
    Then status 200
    And match response[0].name contains 'Lion 1'

  @tag2
  Scenario: Add a new pet to the store
    Given url UrlBase
    And request  {"id": 11111,"category": {"id": 1,"name": "dogs"},"name": "Meg","photoUrls": ["teste"],"tags": [{"id": 1,"name": "friendly"}],"status": "available"}
    When method POST
    Then status 200
    And match response.id == 11111
    And match response.name == 'Meg'
    And match response.status == 'available'

  @tag3
  Scenario: Find Pet by ID
    Given url UrlBase
    And path '5'
    And param status = 'available'
    When method GET
    Then status 200
    And match response.name contains 'doggie'

  @tag4
  Scenario: Delete a Pet
    Given url UrlBase
    And path '2'
    When method DELETE
    Then status 404