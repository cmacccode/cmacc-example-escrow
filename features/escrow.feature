Feature: Escrow
  As a user of the escrow document
  I want to be able to test my input
  To make sure the contract is still valid

  Scenario: Escrow
    Given I compile the "Escrow.cmacc" contract
    Then the value of "seller.full_Name" is "name_Full"
    And the value of "purchaser.full_Name" is "name_Full"
    And the value of "escrow.full_Name" is "name_Full"
    And the value of "arbitrator.full_Name" is "name_Full"
    And the value of "shipper.full_Name" is "name_Full"
