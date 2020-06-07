*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${URL}     https://wizzair.com/pl-pl#/

${BROWSER}               Firefox
${PAGE_TITLE}            Wizz Air

${ZALOGUJ_BUTTON}        data-test="navigation-menu-signin"
${RRJESTRACJA BUTTON}    //a[contains(text(), 'Rejestracja')]
${NAME_IMPUT}           name=firstName
${SURNAME_INPUT}        surname=lastName

*** Test Cases ***
Valid Registration

   Open Main Page

   Click element    Zaloguj sie
   Click element    Rejestracja
   Input Text       Imie
   Input Text       Nazwisko
   Click element    Plec
   Select           Kod Kraju
   Input Text       Telefon
   Input Text       Adres e-mail
   Input Text       Login
   Input Text       Haslo
   Search           Narodowosc
   Select           Akceptuje Informacje o polityce prywatnosci
   Login button     Zarejestruj Sie

  [Teardown]       Close Browser


*** Keywords ***
Open Main Page
  Open browser       ${URL}       ${BROWSER}
  sleep    3
      Title should be      ${PAGE_TITLE}

Click element
