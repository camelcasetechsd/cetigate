Feature: Users
  Test registration types as guest
    [No Type, Training Manager, Testing Center Admin, Student, Proctor, Instructor]
    Testing with and without agreemens
    Test one user with multiple types

Scenario: guest register without username
    Given I am on "/users/new"
        And I fill in "user_form_username" with ""
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/users/new"

Scenario: guest register without password
    Given I am on "/users/new"
        And I fill in "user_form_username" with "username"
        And I fill in "user_form_password" with ""
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/users/new"

Scenario: guest register without type
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUser"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

Scenario: guest register with multiple types
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUserx"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigatex@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigatex@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I check "instructorStatement"
        And I check "studentStatement"
        And I check "trainingManagerStatement"
        And I check "testCenterAdministratorStatement"
        And I check "proctorStatement"
        And I check "Test Center Administrator"
        And I check "Training Manager"
        And I check "Instructor"
        And I check "Student"
        And I check "Proctor"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

Scenario: guest register with instructor type with agreement
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUser2"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate2@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate2@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I check "instructorStatement"
        And I check "Instructor"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

Scenario: guest register with instructor type without agreement
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUser3"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate3@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate3@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I check "Instructor"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

Scenario: guest register with student type with agreement
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUser4"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate4@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate4@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I check "Student"
        And I check "studentStatement"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

Scenario: guest register with student type without agreement
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUser5"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate5@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate5@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I check "Student"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

Scenario: guest register with proctor type with agreement
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUser6"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate6@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate6@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I check "Proctor"
        And I check "proctorStatement"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

Scenario: guest register with proctor type without agreement
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUser7"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate7@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate7@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I check "Proctor"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

Scenario: guest register with training manager type with agreement
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUser8"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate8@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate8@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I check "Training Manager"
        And I check "trainingManagerStatement"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

Scenario: guest register with training manager type without agreement
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUser9"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate9@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate9@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I check "Training Manager"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

Scenario: guest register with testing center admin type with agreement
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUser10"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate10@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate10@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I check "Test Center Administrator"
        And I check "testCenterAdministratorStatement"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

Scenario: guest register with testing center admin type without agreement
    Given I am on "/users/new"
        And I fill in "user_form_username" with "justForTestUser11"
        And I fill in "user_form_password" with "veryStrongP@$$w0rd"
        And I fill in "confirmPassword" with "veryStrongP@$$w0rd"
        And I fill in "email" with "justfortestuser_certigate11@gmail.com"
        And I fill in "confirmEmail" with "justfortestuser_certigate11@gmail.com"
        And I fill in "firstName" with "User"
        And I fill in "firstNameAr" with "User"
        And I fill in "middleName" with "User"
        And I fill in "middleNameAr" with "User"
        And I fill in "lastName" with "User"
        And I fill in "lastNameAr" with "User"
        And I fill in "mobile" with "0111599198"
        And I fill in "phone" with "0111599198"
        And I fill in "addressOne" with "street one"
        And I fill in "addressOneAr" with "street one"
        And I fill in "addressTwo" with "street two"
        And I fill in "addressTwoAr" with "street two"
        And I fill in "city" with "cairo"
        And I fill in "zipCode" with "11111"
        And I fill in "identificationType" with "licence"
        And I fill in "securityQuestion" with "licence"
        And I fill in "securityAnswer" with "i do not have any"
        And I fill in "identificationNumber" with "11111"
        And I fill in "identificationExpiryDate" with "15/02/2020"
        And I fill in "identificationExpiryDateHj" with "21/06/1441"
        And I fill in "dateOfBirth" with "15/02/1980"
        And I fill in "dateOfBirthHj" with "21/06/1401"
        And I fill in hidden "longitude" with "31.23571160000006"
        And I fill in hidden "latitude" with "30.0444196"
        And I check "privacyStatement"
        And I check "Test Center Administrator"
        And I select "Egypt" from "country"
        And I select "Egypt" from "nationality"
        And I select "Arabic" from "language"
        And I attach the file "user.png" to "photo"
    Then I press "Create"
        And I should be on "/"

@ignore
Scenario: List create user
    Given I mock the login session
    And I am on "/"
    And I follow "users"
    Then I should be on "/users"

@ignore
Scenario: open user form 
    Given I mock the login session
    And I am on "/users"
    And I follow "Create new User"
    Then I should be on "/users/new"

@ignore
Scenario: create user
    Given I mock the login session
    And I am on "/users/new"
    When I fill in "username" with "TestUser"
    When I fill in "password" with "password"
    When I fill in "confirmPassword" with "password"
    When I fill in "name" with "User"
    When I fill in "mobile" with "01115991948"
    When I fill in "dateOfBirth" with "02/15/1992"
    When I fill in "startDate" with "07/01/2015"
    When I fill in "vacationBalance" with "20"
    When I fill in "description" with "New Employee"
    When I select "Single" from "maritalStatus"
    When I select "Cairo Branch" from "branch"
    When I select "CSI Department" from "department"
    When I select "Manager Manager" from "manager"
    When I select "Junior Software Developer" from "position"
    When I attach the file "user.png" to "photo"
    And I press "Create"
    Then I should be on "/users"
