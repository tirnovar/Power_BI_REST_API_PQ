# Querying Power BI Datasets by DAX through Admin API

![Architecture Schema](https://media-exp1.licdn.com/dms/image/C5612AQGBPfa1DBZcSw/article-cover_image-shrink_720_1280/0/1642327777393?e=1658361600&v=beta&t=-udcin7FDYD9ApLe3kVGP3BfC5oqCVEdPw06M-EGe1I)

</br>

[My original post from LinkedIn](https://www.linkedin.com/pulse/querying-power-bi-datasets-dax-through-admin-api-%C5%A1t%C4%9Bp%C3%A1n-re%C5%A1l/)

</br>

At the end of last year, a new option appeared in the Power BI REST API (Admin), which allows sending DAX queries against a specific dataset. The JSON with the response then returns up to the 100,000 table rows. This allows you to use DAX queries through Power BI REST API in several exciting scenarios. Here I prepared one ... 

## Scenario
Imagine a learning application used in your company where you learn about a certain topic, and then you are tested. Answers are recorded, so L&D knows what you have done and how you stand. Let's face it. We know a lot of such apps. 
</br> 
But those who usually keep us with us to fulfill them for the next days/weeks must not end with just answering and getting the "RIGHT" or "WRONG" response. They usually remind us regularly and try to bring us back. They often try to achieve this with gamification elements, such as comparison participants or just information about your success over a while. #PowerBI can provide the calculation of results for this "gamification". For example, we obtain data using #PowerAutomate, distributing them to colleagues (students). 

## Limitations
To be able to achieve this data acquisition, we must keep in mind all the limitations that result from the official documentation of this API call.
[Datasets - Execute Queries - REST API (Power BI Power BI REST APIs) | Microsoft Docs](https://docs.microsoft.com/en-us/rest/api/power-bi/datasets/execute-queries)

## Prerequisites – Azure
It is also necessary to decide whether, for this call, it will act as a user or as an application. I am inclined to say that we should make such calls as applications to show the following procedure. First, according to the documentation, we must set API permissions for our application for either Dataset.ReadWrite.All or Dataset.Read.All. Don't forget to have them approved by the admin.

![API Permissions](https://media-exp1.licdn.com/dms/image/C5612AQHkBFf7EFiCBA/article-inline_image-shrink_1500_2232/0/1642325318554?e=1658361600&v=beta&t=Y-L4K4whLUkcIFOfKr4msl9-jGeLz2l1W0ARsA8BmLU)

In the detail of the application, we will immediately copy the data that we will then need. 

**Tenant_Id & Client_Id: Overview**

![Application ID + Tenant ID](https://media-exp1.licdn.com/dms/image/C5612AQFbXDZckQtK1A/article-inline_image-shrink_1500_2232/0/1642329809676?e=1658361600&v=beta&t=SM9MWQ_W_KxcDnVD5XyGnRSIo6QYu4TkPFtXa9ATrCo)

**Client_Secret: Certificates & secrets**

![Application Secret](https://media-exp1.licdn.com/dms/image/C5612AQE6EO6k6lxVlw/article-inline_image-shrink_1500_2232/0/1642329774540?e=1658361600&v=beta&t=NRJkp3Aw6EKSuSxzEtBEt-JY_4LwinE3va-R2s5h5Mc)

## Prerequisites – Power BI Service

Using the Power BI API services through the application must not forget that this option must be enabled in Power BI Admin Portal. 

![Allow Service Principal To Use Power BI APIs](https://media-exp1.licdn.com/dms/image/C5612AQHj8Y00IiCGBw/article-inline_image-shrink_1500_2232/0/1642325470854?e=1658361600&v=beta&t=dfJYmrZt0Ag8i5UmsFJmatlTxC0ZogfQzHxudRU0WPs)

The functionality we require is also a separate setting in Power BI Admin, which must be enabled.

![Enhance Admin APIs responses with DAX and mashup expressions](https://media-exp1.licdn.com/dms/image/C5612AQGFRZt74oV-8g/article-inline_image-shrink_1500_2232/0/1642325495053?e=1658361600&v=beta&t=uLY5hoiSQ0DfWi4J9q6zmb-a4xDb1DBbVt0KfAZqDHY)

You can also query "My workspace" (if you are accessing it as a user). In general, however, you can only query data sets to which the entity (user, application) has permissions. As described in the documentation in the section about limitations. For this reason, I need to add the application to the workspace/dataset where I want it to query and copy its ID.

![Dataset ID in Browser](https://media-exp1.licdn.com/dms/image/C5612AQHVezCv9d__2A/article-inline_image-shrink_1500_2232/0/1642325602827?e=1658361600&v=beta&t=oQwCjojJBHt0DX6-R6442u7c8tDkcFYuvzAlnMBAwiE)

## Let's bring the Power Automate

After the Recurrence trigger, I prepared an initial to compose, storing all necessary values.

![JSON Input for Power Automate](https://media-exp1.licdn.com/dms/image/C5612AQF6oGOcMpsRtQ/article-inline_image-shrink_1500_2232/0/1642325618186?e=1658361600&v=beta&t=wa3uw83JqKWbRg1Sqgp36nRZ4BBRibWPwuT_eNLmpDg)

The following **Parse JSON** step creates records from the values prepared in this way, which I can then use across the entire flow.
We miss the last important information to query directly into the verification token model. While this may seem straightforward, it is crucial for what source you generate it. In this case, and always concerning the Power BI REST API, verification against the source [https://analysis.windows.net/powerbi/api.](https://analysis.windows.net/powerbi/api.)

![Generating OAuth2 Token Power BI REST API in Power Automate](https://media-exp1.licdn.com/dms/image/C5612AQFzUjQZp66HXA/article-inline_image-shrink_1500_2232/0/1642325787750?e=1658361600&v=beta&t=3UjCHFHHP3au_XNykEz5wUjt6d1-oTRzbVEbIzfd_6A)

We parse the obtained answer using the classic Parse JSON method, and we get something that looks something like this.
</br><code>
{
  "token_type": "Bearer",
  "expires_in": "3599",
  "ext_expires_in": "3599",
  "expires_on": "1641987377",
  "not_before": "1641983477",
  "resource": "https://analysis.windows.net/powerbi/api",
  "access_token": "x........................x"
}
</code></br>

Combining the obtained token_type and access_token will give us the exact key that we can use for Authorization to query the Dataset. Please note in advance that the life of this token is limited. So don't try to make many calls on one token.

</br><code>concat(body('tokenReciever')?['token_type'],concat(' ',body('tokenReciever')?['access_token']))</code></br>

The call is made against the following address "https://api.powerbi.com/v1.0/myorg/datasets/{datasetId}/executeQueries", where we insert the obtained token in the header and the query we requested in the body. Here, in this case, I'm getting data for one specific table, so EVALUATE {tableName} is enough for me.

![Execute DAX Query by Power Automate against the Dataset](https://media-exp1.licdn.com/dms/image/C5612AQG4j08oxzLNBw/article-inline_image-shrink_1500_2232/0/1642325964730?e=1658361600&v=beta&t=tQZ44UoooRTRcPJFwJ_9WAMhEMLfYQ3GkPRUkMuvNnE)
</br>
<code>
{
  "results": [
    {
      "tables": [
        {
          "rows": [
            {
              "lastWeek[Email]": "stepan.resl@databrothers.cz",
              "lastWeek[Score]": 3,
              "lastWeek[MaxScore]": 7,
              "lastWeek[SuccessRate]": 0.4285,
              "lastWeek[Index]": 1
            }
          ]
        }
      ]
    }
  ]
}
</code>
</br>

I will parse the obtained answer again. Since Power Automate always sees only two levels of immersion, so in order to get directly to the data, it is necessary to make the first Apply to each, to which we can pass the second level or "tables." It automatically produces the first level of "results" on top of each other. I can call the Post Adaptive card in a chat or channel action in the second level. Here comes the time for creativity. The adaptive card may look different. But if you would like to be inspired, there is a public library.

> [https://adaptivecards.io/samples/SportingEvent.html](https://adaptivecards.io/samples/SportingEvent.html)

I was also inspired here, and I modified the card used in the library to display the match results. Now shows the personalized results of the learning application.

![Adaptive Card with results from Power BI Dataset](https://media-exp1.licdn.com/dms/image/C5612AQHdb1Sv2xocng/article-inline_image-shrink_1500_2232/0/1642326406522?e=1658361600&v=beta&t=fKSgMdbL-ncqlYs0QZA2GBVAN31PG_zTEJtYZC_YXaY)

## Summary 
It is now straightforward to query the data that Power BI has processed, and once the path is created for the first time, it is already very brief. The capabilities that this API call provides in itself push the possible interconnection between Power Platform applications a step further. In the same way, gates open that Power BI may perceive as an integration center to which they will query. Even one Dataset can query the other Dataset in this form without DirectQuery. I am very curious about what ideas others will come up with.
