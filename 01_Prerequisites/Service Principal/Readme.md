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

### App Registration Tool
1) Open Link: [App Registration Tool](https://app.powerbi.com/embedsetup)
2) TBD