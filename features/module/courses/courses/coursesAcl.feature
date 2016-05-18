Feature: course Acl

@javascript 
Scenario: Testing course pages as Admin
    Given I mock the login session as "admin"

    #checking courses list page
    And I go to "/courses"
    Then I should see "COURSES"

    # checking course creation page
    And I press "Create new Course"
    Then I should be on "/courses/new"
    Then I should see "NEW COURSE"

    # checking course edit page
    And I go to "/courses"
    And I perform "Edit" action on row with "Active" value
    Then I should see "EDIT COURSE"

    # checking course events page
    And I go to "/courses"
    And I perform "Course Events" action on row with "Active" value
    Then I should see "COURSE EVENTS"
    And I press "Create new Course Event"
    Then I should see "NEW COURSE EVENT"

    # checking edit course event page
    And I move backward one page
    And I perform "Edit" action on row with "Active" value
    Then I should see "EDIT COURSE EVENT"

    # checking course calendar page 
    And I go to "/courses/calendar"
    Then I should see "COURSES CALENDAR"
    
    # checking more page 
    And I go to "/courses/more/1"
    Then I should see "COURSE DETAILS"

    # checking my courses page 
    And I go to "/courses/mycourses"
    Then I should see "My Courses"

@javascript 
Scenario: Testing course pages as TM
    Given I mock the login session as "tmuser"

    #checking courses list page
    And I go to "/courses"
    Then I should see "You don't have access to this , please contact the admin !"

    # checking course creation page
    And I go to "/courses/new"
    Then I should see "You don't have access to this , please contact the admin !"

    # checking course events page
    And I go to "/course-events/new"
    Then I should see "NEW COURSE EVENT"

    # checking course calendar page 
    And I go to "/courses/calendar"
    Then I should see "COURSES CALENDAR"
    
    # checking more page 
    And I go to "/courses/more/1"
    Then I should see "COURSE DETAILS"

    # checking my courses page 
    And I go to "/courses/mycourses"
    Then I should see "My Courses"
    
@javascript 
Scenario: Testing course pages as TCA
    Given I mock the login session as "tcauser"

    #checking courses list page
    And I go to "/courses"
    Then I should see "You don't have access to this , please contact the admin !"

    # checking course creation page
    And I go to "/courses/new"
    Then I should see "You don't have access to this , please contact the admin !"

    # checking course events page
    And I go to "/course-events/new"
    Then I should see "You don't have access to this , please contact the admin !"

    # checking course calendar page 
    And I go to "/courses/calendar"
    Then I should see "COURSES CALENDAR"
    
    # checking more page 
    And I go to "/courses/more/1"
    Then I should see "COURSE DETAILS"

    # checking my courses page 
    And I go to "/courses/mycourses"
    Then I should see "My Courses"
    
@javascript 
Scenario: Testing course pages as instructor
    Given I mock the login session as "instructor"

    #checking courses list page
    And I go to "/courses"
    Then I should see "You don't have access to this , please contact the admin !"

    # checking course creation page
    And I go to "/courses/new"
    Then I should see "You don't have access to this , please contact the admin !"

    # checking course events page
    And I go to "/course-events/new"
    Then I should see "You don't have access to this , please contact the admin !"

    # checking course calendar page 
    And I go to "/courses/calendar"
    Then I should see "COURSES CALENDAR"
    
    # checking more page 
    And I go to "/courses/more/1"
    Then I should see "COURSE DETAILS"

    # checking my courses page 
    And I go to "/courses/mycourses"
    Then I should see "My Courses"
    
@javascript 
Scenario: Testing course pages as student
    Given I mock the login session as "student"

    #checking courses list page
    And I go to "/courses"
    Then I should see "You don't have access to this , please contact the admin !"

    # checking course creation page
    And I go to "/courses/new"    
    Then I should see "You don't have access to this , please contact the admin !"

    # checking course events page
    And I go to "/course-events/new"
    Then I should see "You don't have access to this , please contact the admin !"

    # checking course calendar page 
    And I go to "/courses/calendar"
    Then I should see "COURSES CALENDAR"
    
    # checking more page 
    And I go to "/courses/more/1"
    Then I should see "COURSE DETAILS"

    # checking my courses page 
    And I go to "/courses/mycourses"
    Then I should see "My Courses"