Feature: Booker-example Feature

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
      When  the user requests booking with following data:
        | firstname                 | Mike       |
        | lastname                  | Lidstrom   |
        | totalprice                | 543        |
        | depositpaid               | true       |
        | additionalneeds           | Jacuzzi    |
        | bookingdates --> checkin  | 2020-05-13 |
        | bookingdates --> checkout | 2020-05-15 |
      Then  user gets status code "200"
      When the user gets requested booking:
      Then user gets status code "200"
      And the response contains the following values:
        | firstname       | Mike       |
        | lastname        | Lidstrom   |
        | totalprice      | 543        |
        | depositpaid     | true       |
        | additionalneeds | Jacuzzi    |
      And   the path "bookingdates" contains the following values:
        | checkin  | 2020-05-13 |
        | checkout | 2020-05-15 |


    Scenario: Booking - UpdateBooking
      Given the user requests token with username "admin" and password "password123"
      When  the user requests booking with following data:
        | firstname                 | Mike       |
        | lastname                  | Lidstrom   |
        | totalprice                | 543        |
        | depositpaid               | true       |
        | additionalneeds           | Jacuzzi    |
        | bookingdates --> checkin  | 2020-05-13 |
        | bookingdates --> checkout | 2020-05-15 |
      Then  user gets status code "200"
      # And   the user received one value in path "bookingid" and sets session variable with this name "bookingId"
      When  the user requests to update booking with following data:
        | firstname                 | Mike       |
        | lastname                  | Sundstrom  |
        | totalprice                | 700        |
        | depositpaid               | true       |
        | additionalneeds           | Vodka      |
        | bookingdates --> checkin  | 2020-05-13 |
        | bookingdates --> checkout | 2020-05-20 |
      Then  user gets status code "200"
      And   the response contains the following values:
        | firstname       | Mike       |
        | lastname        | Sundstrom  |
        | totalprice      | 700        |
        | depositpaid     | true       |
        | additionalneeds | Vodka      |
      And   the path "bookingdates" contains the following values:
        | checkin  | 2020-05-13 |
        | checkout | 2020-05-20 |


    Scenario: Booking - UpdateBooking - Negative
      Given the user requests token with username "admin" and password "password123"
      When  the user requests booking with following data:
        | firstname                 | Mike       |
        | lastname                  | Lidstrom   |
        | totalprice                | 543        |
        | depositpaid               | true       |
        | additionalneeds           | Jacuzzi    |
        | bookingdates --> checkin  | 2020-05-13 |
        | bookingdates --> checkout | 2020-05-15 |
      Then  user gets status code "200"
    # And   the user received one value in path "bookingid" and sets session variable with this name "bookingId"
      When  the user requests to update booking with following data:
        | bookingdates --> checkin  | 2020-05-13 |
        | bookingdates --> checkout | 2020-05-20 |
      Then  user gets status code "400"

    Scenario: Booking - PartialUpdateBooking
      Given the user requests token with username "admin" and password "password123"
      When  the user requests booking with following data:
        | firstname                 | Mike       |
        | lastname                  | Lidstrom   |
        | totalprice                | 543        |
        | depositpaid               | true       |
        | additionalneeds           | Jacuzzi    |
        | bookingdates --> checkin  | 2020-05-13 |
        | bookingdates --> checkout | 2020-05-15 |
      Then  user gets status code "200"
    # And   the user received one value in path "bookingid" and sets session variable with this name "bookingId"
      When  the user requests to partially update booking with following data:
        | bookingdates --> checkin  | 2020-05-13 |
        | bookingdates --> checkout | 2020-05-23 |
      Then  user gets status code "200"
      And   the path "bookingdates" contains the following values:
        | checkin  | 2020-05-13 |
        | checkout | 2020-05-23 |

    @run
    Scenario: DeleteBooking
      Given the user requests token with username "admin" and password "password123"
      When  the user requests booking with following data:
        | firstname                 | Mike       |
        | lastname                  | Lidstrom   |
        | totalprice                | 543        |
        | depositpaid               | true       |
        | additionalneeds           | Jacuzzi    |
        | bookingdates --> checkin  | 2020-05-13 |
        | bookingdates --> checkout | 2020-05-15 |
      Then  user gets status code "200"
      And   the user received one value in path "bookingid" and sets session variable with this name "bookingId"
      When  the user deletes the booking
      Then  user gets status code "201"
      And   the user gets requested booking
      Then  user gets status code "404"
