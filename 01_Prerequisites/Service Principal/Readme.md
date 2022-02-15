# Service Principal
## Creating Applications
There are two ways to create an application:
- From [Azure Active Directory](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview)
- From [App Registration Tool](https://app.powerbi.com/embedsetup)

### Azure Active Directory
1) Open Link: [Azure Active Directory](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview)
2) Manage -> App Registration
3) New registration
4) **Fill form:** </br>
       **Name: <your_app_name>**, </br>
       **Supported account type: <supported_acccount_type>** *(It depends on your intent. But mostly it will be: "Accounts in this organizational directory only (DataBrothers only - Single tenant)"*, </br>
       **Redirect URI: <select_platform> + <url_adress>** *(This doesnt have to be filled. But it is recommended to fill it. It will be used to redirect the user after the user has logged in. For example: https://localhost:44300/redirect)*, </br>
5) Register
6) You will be redirected to page about your application. There you can find **Application (Client) ID** and **Directory (Tenant) ID** in Essentials section.
7) Switch to **Certificates & secrets** tab and click on **New client secret**.
8) Set Description, Expiration date and click on Add button.
9) !! Dont forget to copy Value (it will be your **Client Secret**) and Secret ID to safe place. *(Like to Azure Key Vault)*
10) Go to **API permissions** tab and set all required **API permissions**. *(Required persmisions for selected call can be find in main [Readme.md](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/README.md) file of this repository)*
11) You made it? Wonderful!! Now you have your Service Principal ready to go! Have you already set up your Power BI Admin portal ([LINK](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/01_Prerequisites/Power%20BI%20Admin%20Set%20Up/Readme.md))?


### App Registration Tool
1) Open Link: [App Registration Tool](https://app.powerbi.com/embedsetup)
2) TBD