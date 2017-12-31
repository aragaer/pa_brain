# vim: tabstop=4 expandtab shiftwidth=2 softtabstop=2
Feature: Greeting
  As a personal assistant user
  I want my personal assistant to greet me properly
  So that it feels more like a living person

  Scenario: Reply to greeting
    Given the brain is running
     When I say "hello"
     Then pa replies "hello"

  Scenario: First phrase greeting
    Given the brain is running
     When I say "unintelligible"
     Then pa replies "hello"
      And pa says "failed to parse"

  Scenario: Cron event greeting
    Given the brain is running
     When "cron go to bed" event comes
     Then pa says "hello"
      And pa says "go to bed"

  Scenario: Repeated greeting
    Given the brain is running
      And already said hello
     When I say "hello"
     Then pa replies "seen already"

  Scenario: New day
    Given the brain is running
      And already said hello
      And "new day" event happened
     When I say "hello"
     Then pa replies "hello"

  Scenario: Goodbye
    Given the brain is running
     When I say "goodbye"
     Then pa replies "goodbye"
