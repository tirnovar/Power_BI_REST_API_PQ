# Power BI REST API CUSTOM Function Library

[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/%C5%A1t%C4%9Bp%C3%A1n-re%C5%A1l-464084152/) [![Twitter](https://img.shields.io/badge/twitter-%231DA1F2.svg?style=for-the-badge&logo=Twitter&logoColor=white)](https://twitter.com/tpnRel1)

## Authentication Functions:
Method | Name | Description | Requirements
------ | ---- | ----------- | ------------
Post | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | Generate Bearer Token that is needed for calling Power BI REST API | AzureTenantId + AzureApplicationClientId + AzureApplicationClientSecret
Post | [GraphAPI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/GraphAPI%20Token/get-GraphBearerToken.pq) | Generate Bearer Token that is needed for calling GraphAPI | AzureTenantId + AzureApplicationClientId + AzureApplicationClientSecret

## Admin Functions:
### API Permissions: Tenant.Read.All or Tenant.ReadWrite.All (Power BI Service)
Method | Name | Description | Requirements | Call limits
------ | ---- | ----------- | ------------ | -----------
Get | [Capacities](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Capacities/Get%20Capacities/get-Capacities.pq) | Get all Power BI Capactities that are in your tenant | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | Not Defined
Get | [Capacity Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Capacities/Get%20Capacity%20Users/get-CapacityUsersAsAdmin.pq) | Returns users assigned to selected capacity | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [CapacityId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Capacities/Get%20Capacities/get-Capacities.pq) | Not Defined
Get | [Workspaces](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Groups%20(Workspaces)/Get%20Groups%20Without%20Users/get-GroupsAsAdmin.pq) | Get All Workspaces (Groups) in tenant | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | 50 calls/per hour/per tenant. Time out after 30s
Get | [Workspaces with Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Groups%20(Workspaces)/Get%20Groups%20With%20Users/get-GroupsWithUsersAsAdmin.pq) | Get All Workspaces (Groups) in tenant with their users | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | 200 calls per hour
Get | [Modified Workspaces](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Groups%20(Workspaces)/Get%20Modified%20Groups/get-ModifiedWorkspaces.pq) | Returns workspaces that has been modified since last call | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | 30 calls per hour
Get | [Apps Without Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Apps%20As%20Admin/Without%20Users/get-AppsAsAdminWithoutUsers.pq) | Get All Apps in tenant | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | 200 calls per hour
Get | [Apps With Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Apps%20As%20Admin/With%20Users/get-AppsAsAdminWithUsers.pq) | Get All Apps in tenant with users | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [App Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Apps%20As%20Admin/Get%20Users%20Of%20App/get-AppUsersAsAdmin.pq) | 200 calls per hour
Get | [App Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Apps%20As%20Admin/Get%20Users%20Of%20App/get-AppUsersAsAdmin.pq) | Returns all assinged users to selected App | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [AppID](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Apps%20As%20Admin/Without%20Users/get-AppsAsAdminWithoutUsers.pq) | 200 calls per hour
Get | [Pipelines](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Pipelines/get-PipelinesAsAdmin.pq) | Get All pipelines in tenant | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | 200 calls per hour
Get | [Dataflows](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Dataflows/get-DataflowsAsAdmin.pq) | Get All dataflows in tenant | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | Not Defined
Get | [Datasets Without Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Datasets%20Without%20Users/get-DatasetsAsAdminWithoutUsers.pq) | Get All datasets in tenant without users | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | Not Defined
Get | [Datasets With Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Datasets%20With%20Users/get-DatasetsAsAdminWithUsers.pq) | Get All datasets in tenant with users | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [Dataset Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Users%20For%20Dataset/get-DatasetUsersAsAdmin.pq) | 200 calls per hour
Get | [Dataset Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Users%20For%20Dataset/get-DatasetUsersAsAdmin.pq) | Return users that are assigned to selected dataset with their rights | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [DatasetId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Datasets%20Without%20Users/get-DatasetsAsAdminWithoutUsers.pq) | 200 calls per hour
Get | [Dataset Refresh History](https://github.com/tirnovar/m-custom-functions/tree/master/Power%20BI%20REST%20API/Admin/Datasets/Get%20Refreshes%20of%20Dataset) | Returns refresh history for selected dataset | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [DatasetId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Datasets%20Without%20Users/get-DatasetsAsAdminWithoutUsers.pq) | Not Defined
Get | [Dataset Last Error Refresh](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Last%20Dataset%20Refresh%20Error%20(by%20last%2010%20refreshes)/get-LastDatasetRefreshErrorByLast10Refreshes.pq) | Returns the last Error refresh from last 10 refreshes | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [DatasetId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Datasets%20Without%20Users/get-DatasetsAsAdminWithoutUsers.pq) | Not Defined
Get | [Datasets In Workspace](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Datasets%20In%20Groups/get-DatasetsInGroupsAsAdmin.pq) | Returns All datasets that are stored in selected workspace | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [WorkspacesId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Groups%20(Workspaces)/Get%20Groups%20Without%20Users/get-GroupsAsAdmin.pq) | 200 calls per hour
Get | [Datasets With Users & Datasources](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Datasets%20With%20Users%20%26%20Datasources/get-DatasetsAsAdminWithUsers%26Datasources.pq) | Get All datasets with Users & Datasources. This call is not good to call if you have larger amount of datasets. (Calls for Users & Datasource for exact datasource are separete API Calls) | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [Dataset Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Users%20For%20Dataset/get-DatasetUsersAsAdmin.pq) + [Datasources of Dataset](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Datasources%20Of%20Dataset/get-DatasourcesOfDatasetAsAdmin.pq) | 200 calls per hour
Get | [Datasources of Dataset](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Datasets/Get%20Datasources%20Of%20Dataset/get-DatasourcesOfDatasetAsAdmin.pq) | Returns All datasources that are inside selected dataset | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | Not Defined
Get | [Dashboards](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Dashboards/Get%20Dashboards/get-DashboardsAsAdmin.pq) | Get All dashboards in tenant | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | 200 calls per hour
Get | [Dashboard Tiles](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Dashboards/Get%20Tiles/get-DashboardTilesAsAdmin.pq) | Returns All tiles from selected dashboard | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [DashboardId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Dashboards/Get%20Dashboards/get-DashboardsAsAdmin.pq) | 200 calls per hour
Get | [Dashboards In Workspace With Tiles](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Dashboards/Get%20Dashboards%20With%20Tiles%20from%20Selected%20Group/get-DashboardsFromWorkspaceWithTilesAsAdmin.pq) | Returns All dashboards from selected workspace with their tiles | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [WorkspacesId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Groups%20(Workspaces)/Get%20Groups%20Without%20Users/get-GroupsAsAdmin.pq) + [Dashboard Tiles](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Dashboards/Get%20Tiles/get-DashboardTilesAsAdmin.pq) | 200 calls per hour
Get | [Reports](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Reports/Get%20Reports/get-ReportsAsAdmin.pq) | Get All reports in tenant | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | 200 calls per hour
Get | [Report Users](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Reports/Get%20Report%20Users/get-ReportUsersAsAdmin.pq) | Return users that are assigned to selected report | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [ReportId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Reports/Get%20Reports/get-ReportsAsAdmin.pq) | 200 calls per hour
Get | [Reports in Workspace](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Reports/Get%20Reports%20in%20Group/get-ReportsInGroupAsAdmin.pq) | Get All reports that are stored in selected workspace | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [WorkspacesId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Groups%20(Workspaces)/Get%20Groups%20Without%20Users/get-GroupsAsAdmin.pq) | 200 calls per hour
Get | [Report Subscriptions](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Reports/Get%20Report%20Subscriptions/get-ReportSubscriptionsAsAdmin.pq) | Return subscriptions that are created for selected report | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [ReportId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Reports/Get%20Reports/get-ReportsAsAdmin.pq) | 200 calls per hour
Get | [User Artifact Access](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Users/User%20Artifact%20Access/get-UserArtifactAccessAsAdmin.pq) | Return all artifact access (Datasets, Reports,...) that selected user or entity have | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + Identifier/UPN | 200 calls per hour
Get | [User Subscriptions](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Users/User%20Subscriptions/get-UserSubscriptionsAsAdmin.pq) | Return all subscriptions that selected user or entity have | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + Identifier/UPN | 200 calls per hour
Get | [Imports](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Imports/get-Imports.pq) | Returns All Imports that has been made into Power BI Service | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | 200 calls per hour
Get | [Available Features](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Available%20Features/get-AvailableFeatures.pq) | Returns all features that are registered in your Power BI Service | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | Not Defined
Get | [Links Shared To Whole Organization](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Widely%20Shared%20Artifacts/Links%20Shared%20To%20Whole%20Organization/get-LinksSharedToWholeOrganization.pq) | Get the links shared to the whole organization | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | 200 calls per hour
Get | [Published To Web](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Widely%20Shared%20Artifacts/Published%20To%20Web/get-PublishedToWeb.pq) | Get all reports that are published to web | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) | 200 calls per hour

### API Permissions: InformationProtectionPolicy.Read.All (GraphAPI)
Method | Name | Description | Requirements
------ | ---- | ----------- | ------------
Get | [Information Protections Labels](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Information%20Protection/Labels/Get%20Labels/get-InfromationProtectionLabels.pq) | Get All labels that can be used in your company | [GraphAPI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/GraphAPI%20Token/get-GraphBearerToken.pq)

--> Sensitivity labes can on **Dataflow / Dataset / Report / Workbook / Dashboard** be find out by [Scan Results](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/ScannerAPI/Get%20Scanned%20Result/get-ScanResult.pq)

## Scanner API Functions:
Method | Name | Description | Requirements | Call limits
------ | ---- | ----------- | ------------ | -----------
Post | [GetInfo](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/ScannerAPI/Get%20Info/get-getInfo.pq) | Start scanning to selected Workspace | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [WorkspaceId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Groups%20(Workspaces)/Get%20Groups%20Without%20Users/get-GroupsAsAdmin.pq) | 500 calls per hour and 16 simultaneous requests
Get | [Scan Status](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/ScannerAPI/Get%20Scan%20Status/get-ScanStatus.pq) | Returns actual status of called scan (by ID) | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [scanId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/ScannerAPI/Get%20Info/get-getInfo.pq) | 10 000 calls per hour
Get | [Scan Results](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/ScannerAPI/Get%20Scanned%20Result/get-ScanResult.pq) | Returns results of called scan (by ID) !(Works only when [Scan Status](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/ScannerAPI/Get%20Scan%20Status/get-ScanStatus.pq) is "Successful")! | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [scanId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/ScannerAPI/Get%20Info/get-getInfo.pq) | 500 calls per hour
Get | [Scan Status and / or Results](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/ScannerAPI/Get%20Scan%20Status%20And%20Results/get-ScanStatusAndResult.pq) | Call [Scan Status](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/ScannerAPI/Get%20Scan%20Status/get-ScanStatus.pq) and if result is "Successful" then [Scan Results](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/ScannerAPI/Get%20Scanned%20Result/get-ScanResult.pq) is called for results | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [scanId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/ScannerAPI/Get%20Info/get-getInfo.pq) | 500 calls per hour

## Gateways:
### To get Gateways in tenant you need User Token from user that has access into [Power Platform - Admin portal](admin.powerplatform.microsoft.com/ext/DataGateways) 
Link To [📖 Documentation](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Gateways/Readme.md) 

Method | Name | Description | Requirements
------ | ---- | ----------- | ------------
Get | [Create URL to user Login](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Gateways/Build%20Initial%20Call%20URL/get-InitialCallURLToUserToken.pq) | This query returns an URL that User opens in browser and login to recieve requested URL ANSWER | AzureTenantId + AzureApplicationClientId
Get | [Extract code](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Gateways/Extract%20Code%20From%20URL/get-CodeFromURL.pq) | Returns extracted code from response after user loggin | [Create URL to user Login](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Gateways/Build%20Initial%20Call%20URL/get-InitialCallURLToUserToken.pq)
Post | [Refresh Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Gateways/cURL%20To%20Exchange%20Code%20To%20Refresh%20Token/cURL_POST_MSFT_LOGIN) | cURL to get Refresh Token from Postman | [Extract code](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Gateways/Extract%20Code%20From%20URL/get-CodeFromURL.pq) + AzureTenantId + AzureApplicationClientId + AzureApplicationClientSecret
Get | [User Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Gateways/Get%20User%20Token/get-UserToken.pq) | Returns User Access Token | [Refresh Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Gateways/cURL%20To%20Exchange%20Code%20To%20Refresh%20Token/cURL_POST_MSFT_LOGIN) + AzureTenantId + AzureApplicationClientId + AzureApplicationClientSecret
Get | [Gateways](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Gateways/Get%20Gateways/get-Gateways.pq) | Returns All gateways in tenant | [Get User Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Gateways/Get%20User%20Token/get-UserToken.pq)

## Scorecards & Goals
### API Permissions: Dataset.Read.All or Dataset.ReadWrite.All (Power BI Service)
Method | Name | Description | Requirements | Call limits
------ | ---- | ----------- | ------------ | -----------
Get | [Scorecards from workspace](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Scorecards%20%26%20Goals/Scorecards/get-ScorecardByWorkspace.pq) | Returns Scorecards that are stored in selected workspace. (User / Service principal need to be assinged into workspace to be able to see these scorecards) | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [WorkspacesId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Groups%20(Workspaces)/Get%20Groups%20Without%20Users/get-GroupsAsAdmin.pq) | Not Defined
Get | [Goals from scorecard](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Scorecards%20%26%20Goals/Goals/Goals%20from%20selected%20Scorecard/get-GoalsFromScorecard.pq) | Return goals from selected scorecard | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + [WorkspacesId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Admin/Groups%20(Workspaces)/Get%20Groups%20Without%20Users/get-GroupsAsAdmin.pq) + [ScorecardId](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Scorecards%20%26%20Goals/Scorecards/get-ScorecardByWorkspace.pq) | Not Defined

## Querying Datasets
### API Permissions: Dataset.Read.All or Dataset.ReadWrite.All (Power BI Service)
Method | Name | Description | Requirements | Call limits
------ | ---- | ----------- | ------------ | -----------
Get | [Data from Different Dataset](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Quering%20Datasets/get-DataFromDifferentDataset.pq) | Returns data that are result of DAX Query or Table in selected Dataset | [PBI - Bearer Token](https://github.com/tirnovar/Power_BI_REST_API_PQ/blob/main/Power%20BI%20Service%20Token/get-BearerToken.pq) + DatasetId + TableName ( + Own DAX Query <- OPTIONAL ) | MAX 100 000 table rows per query, One table request per query, One query per API call, Datasets with RLS are not supported, Dataset has to be in Workspace V2
