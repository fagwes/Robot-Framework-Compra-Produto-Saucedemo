*** Settings ***
Library    SeleniumLibrary
Library    ScreenCapLibrary

*** Variables ***
#Dados do teste
${UserName}     standard_user 
${Password}     secret_sauce   
${FirstName}     Wesley 
${LastName}      Amorim   
${CodePostal}    07193280

#Variaveis de configuracao
${url}    https://www.saucedemo.com/
${brownser}    chrome   
     
#Elementos

#Texto
${input_username}                  xpath= //*[@id="user-name"]
${input_password}                  xpath= //*[@id="password"]
${input_firstname}                 xpath: //*[@id="first-name"]
${input_lasttname}                 xpath: //*[@id="last-name"]
${input_codepostal}                xpath: //*[@id="postal-code"]
    
#Botao
${buttons_add}                 xpath: //*[@id="add-to-cart-sauce-labs-backpack"]
${button_carrinho}             xpath: //*[@id="shopping_cart_container"]/a
${button_checkout}             xpath: //*[@id="checkout"]
${button_continue}             xpath: //*[@id="continue"]
${button_finish}               xpath: //*[@id="finish"]
${button_backhome}             xpath: //*[@id="back-to-products"]



*** Keywords ***
Given que eu esteja no site Saucedemo
    Open Browser    ${url}        ${brownser}    
    Maximize Browser Window
    Start Gif Recording

When digito os dados nas lacunas de login
    Input Text    ${input_username}                   ${UserName}
    Input Text    ${input_password}                   ${Password}
 
   
And clico no botao de login
    Submit Form

    Wait Until Element Is Visible    ${buttons_add}
    Click Element                    ${buttons_add}  

    Wait Until Element Is Visible    ${button_carrinho}
    Click Element                    ${button_carrinho}  

    Wait Until Element Is Visible    ${button_checkout} 
    Click Element                    ${button_checkout}     
      
    
When digito os dados nas lacunas novamente

    Input Text    ${input_firstname}                  ${FirstName}
    Input Text    ${input_lasttname}                  ${LastName}
    Input Text    ${input_codepostal}                 ${Password} 

And clico nos botoes novamente

    Wait Until Element Is Visible    ${button_continue}
    Click Element                    ${button_continue}
   
    Wait Until Element Is Visible    ${button_finish}
    Click Element                    ${button_finish}

    Wait Until Element Is Visible    ${button_backhome}
    Click Element                    ${button_backhome}

Then registro realizado com sucesso
    Close Browser
    Stop Gif Recording

*** Test Cases ***
Cenario 1: login de usuário no site Saucedemo
    Given que eu esteja no site Saucedemo
    When digito os dados nas lacunas de login
    And clico no botao de login
    When digito os dados nas lacunas novamente
    And clico nos botoes novamente
    Then registro realizado com sucesso

# Utilize jogo da velha para comentário #
    
