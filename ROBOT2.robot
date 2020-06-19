*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${URL}     https://wizzair.com/pl-pl#/

${BROWSER}              Firefox
${PAGE_TITLE}           Oficjalna strona Wizz Air | Rezerwuj bezpośrednio, by skorzystać z najlepszych cen

${NAME}                 Anna
${SURNAME}              Zofia
${GENDER}               Kobieta
${COUNTRY_CODE}         +48
${PHONE_NUMBER}         123456789
${EMAIL}                ania@gmail.com
${PASSWORD}             Ania1Zofia2
${COUNTRY}              Polska


*** Test Cases ***
Valid Registration

  Open main page
  Click login button
  Click registration button
  Fill valid NAME
  Fill valid SURNAME
  Choose GENDER
  Choose COUNTRY CODE
  Fill valid PHONE NUMBER
  Fill valid EMAIL
  Fill valid PASSWORD
  Choose COUNTRY
  Accept Privacy Politycy
  Click final registration button

  #[Teardown]       Close Browser


*** Keywords ***
Open Main Page
  Open browser       ${URL}       ${BROWSER}
  Sleep     20

  Title should be      ${PAGE_TITLE}

Click login button
  Click element       xpath://button[@data-test="navigation-menu-signin"]

Click registration button
  Click element       xpath://button[text()=' Rejestracja ']

Fill valid NAME
  Input Text          xpath://input[@placeholder="Imię"]    ${NAME}

Fill valid SURNAME
  Input Text         xpath://input[@placeholder="Nazwisko"]      ${SURNAME}

Choose GENDER
  Click element      xpath://label[@data-test="register-genderfemale"]

Choose COUNTRY CODE
  Click element      xpath://div[@class="phone-number__calling-code-selector__empty__placeholder"]
  Input text         xpath://input[@name="phone-number-country-code"]    ${COUNTRY_CODE}

Fill valid PHONE NUMBER
  Input Text        xpath://input[@data-test="check-in-step-contact-phone-number"]     ${PHONE_NUMBER}

Fill valid EMAIL
  Input Text       xpath://input[@data-test="booking-register-email"]      ${EMAIL}

Fill valid PASSWORD
  Input Text       xpath://input[@data-test="booking-register-password"]     ${PASSWORD}

Choose COUNTRY
  Input Text    xpath://input[@data-test="booking-register-country"]     ${COUNTRY}

Accept Privacy Politycy
  Click element    xpath://label[@for="registration-privacy-policy-checkbox"]

Click final registration button
  Click element   xpath://button[@data-test="booking-register-submit"]
