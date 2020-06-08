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
  Click registration button

  [Teardown]       Close Browser


*** Keywords ***
Open Main Page
  Open browser       ${URL}       ${BROWSER}
  Title should be      ${PAGE_TITLE}

Click login button
  Click element    class:data-test="navigation-menu-signin"

Click registration buttton
  Click element

Fill valid NAME
  Input Text NAME=FirstName     {NAME}

Fill valid SURNAME
  Input Text NAME=LastName      {SURNAME}
