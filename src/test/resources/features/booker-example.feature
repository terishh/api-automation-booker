Feature: Booker-example Feature

  @run
  Scenario: Booking - GetBookingIds
    When  the user requests booking ids
    Then  user gets status code "200"
    And   the amount of Booking Ids is "10"

  Scenario: Booking - CreateBooking
    When  the user requests booking with following data:
      | firstname                 | Mike       |
      | lastname                  | Lidstrom   |
      | totalprice                | 543        |
      | depositpaid               | true       |
      | additionalneeds           | Jacuzzi    |
      | bookingdates --> checkin  | 2020-05-13 |
      | bookingdates --> checkout | 2020-05-15 |
    Then  user gets status code "200"
    And   the path "booking" contains the following values:
      | firstname       | Mike       |
      | lastname        | Lidstrom   |
      | totalprice      | 543        |
      | depositpaid     | true       |
      | additionalneeds | Jacuzzi    |
    And   the path "booking --> bookingdates" contains the following values:
      | checkin  | 2020-05-13 |
      | checkout | 2020-05-15 |

    Scenario: Booking - GetBooking

    Scenario: Booking - UpdateBooking

    Scenario: Booking - UpdateBooking - Negative

    Scenario: Booking - PartialUpdateBooking

    Scenario: DeleteBooking
