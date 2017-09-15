Feature: Escrow
  As a user of the escrow document
  I want to be able to test my input
  To make sure the contract is still valid

  Scenario: Escrow
    Given I compile the "Escrow.cmacc" contract
    Then the following variable value pairs exist:
      | variable             | value     |
      | seller.full_Name     | name_Full |
      | purchaser.full_Name  | name_Full |
      | escrow.full_Name     | name_Full |
      | arbitrator.full_Name | name_Full |
      | shipper.full_Name    | name_Full |

  Scenario: Step1_Parties
    Given I compile the "Step1_Parties.cmacc" contract
    Then the following variable value pairs exist:
      | variable                  | value                                              |
      | seller.full_Name          | Gerry's Grapes, LLC                                |
      | escrow.full_Name          | Safe Hands Facilitated Transactions, Inc.          |
      | arbitrator.full_Name      | {{individual.first_Name}} {{individual.last_Name}} |
      | shipper.full_Name         | Fabulous Express, Inc.                             |
      | deal.seller.full_Name     | Gerry's Grapes, LLC                                |
      | deal.purchaser.full_Name  | name_Full                                          |
      | deal.escrow.full_Name     | Safe Hands Facilitated Transactions, Inc.          |
      | deal.arbitrator.full_Name | {{individual.first_Name}} {{individual.last_Name}} |
      | deal.shipper.full_Name    | Fabulous Express, Inc.                             |

  Scenario: Step2_Order
    Given I compile the "Step2_Order.cmacc" contract
    Then the following variable value pairs exist:
      | variable                  | value                                              |
      | purchaser.full_Name       | {{individual.first_Name}} {{individual.last_Name}} |
      | deal.seller.full_Name     | Gerry's Grapes, LLC                                |
      | deal.purchaser.full_Name  | {{individual.first_Name}} {{individual.last_Name}} |
      | deal.escrow.full_Name     | Safe Hands Facilitated Transactions, Inc.          |
      | deal.arbitrator.full_Name | {{individual.first_Name}} {{individual.last_Name}} |
      | deal.shipper.full_Name    | Fabulous Express, Inc.                             |

  Scenario: Step3_Signature
    Given I compile the "Step3_Signature.cmacc" contract
    Then the following variable value pairs exist:
      | variable                              | value     |
      | sign_Block.party1.sign_Rep.first_Name | Geraldine |
      | sign_Block.party2.sign_Rep.first_Name | Roberta   |
      | sign_Block.party3.sign_Rep.first_Name | Samuel    |
      | sign_Block.party4.sign_Rep.first_Name | Solomon   |

  Scenario: Step4_Claim
    Given I compile the "Step4_Claim.cmacc" contract
    Then the following variable value pairs exist:
      | variable                   | value                                              |
      | claim.seller.full_Name     | Gerry's Grapes, LLC                                |
      | claim.purchaser.full_Name  | {{individual.first_Name}} {{individual.last_Name}} |
      | claim.escrow.full_Name     | Safe Hands Facilitated Transactions, Inc.          |
      | claim.shipper.full_Name    | Fabulous Express, Inc.                             |
      | claim.product_Description  | eighteen cases of grape preserves                  |
      | claim.escrow_Effective_YMD | 2014-08-13                                         |

  Scenario: Step5_Response
    Given I compile the "Step5_Response.cmacc" contract
    Then the following variable value pairs exist:
      | variable                     | value                                              |
      | response.seller.full_Name    | Gerry's Grapes, LLC                                |
      | response.purchaser.full_Name | {{individual.first_Name}} {{individual.last_Name}} |
      | response.escrow.full_Name    | Safe Hands Facilitated Transactions, Inc.          |
      | response.claim_YMD           | 2014-08-16                                         |
