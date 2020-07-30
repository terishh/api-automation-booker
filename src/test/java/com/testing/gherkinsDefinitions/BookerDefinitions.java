package com.testing.gherkinsDefinitions;

import com.testing.serenitySteps.BookerSteps;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

import java.io.IOException;

public class BookerDefinitions {

  @Given("^the user requests token with username \"([^\"]*)\" and password \"([^\"]*)\"$")
  public void theUserAuthorisesWithUsernameAndPassword(String username, String password) throws Throwable {
    BookerSteps.getToken(username, password);
  }

  @When("^the user requests booking ids$")
  public void theUserRequestsBookingIds() {
    BookerSteps.getBookingIds();
  }

  @And("^the amount of Booking Ids is \"([^\"]*)\"$")
  public void theAmountOfBookingIdsIs(Integer amount) {
    BookerSteps.validateAmountOfBookingIds(amount);
  }
}
