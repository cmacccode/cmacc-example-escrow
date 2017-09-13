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


  Scenario: Step1_Parties
    Given I compile the "Step1_Parties.cmacc" contract
    Then the value of "seller.full_Name" is "Gerry's Grapes, LLC"
    And the value of "escrow.full_Name" is "Safe Hands Facilitated Transactions, Inc."
    And the value of "arbitrator.full_Name" is "{{individual.first_Name}} {{individual.last_Name}}"
    And the value of "shipper.full_Name" is "Fabulous Express, Inc."
    And the value of "deal.seller.full_Name" is "Gerry's Grapes, LLC"
    And the value of "deal.purchaser.full_Name" is "name_Full"
    And the value of "deal.escrow.full_Name" is "Safe Hands Facilitated Transactions, Inc."
    And the value of "deal.arbitrator.full_Name" is "{{individual.first_Name}} {{individual.last_Name}}"
    And the value of "deal.shipper.full_Name" is "Fabulous Express, Inc."



