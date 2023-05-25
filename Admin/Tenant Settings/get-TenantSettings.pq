let
    output =
        (generatedToken as text) =>
            let
                apiCall =
                    Json.Document(
                        Web.Contents(
                            "https://api.fabric.microsoft.com/v1",
                            [
                                RelativePath = "admin/tenantsettings",
                                Headers = [
                                    #"Content-Type" = "application/json",
                                    Authorization = generatedToken
                                ]
                            ]
                        )
                    )
            in
                #table(
                    type table [
                        settingName = text,
                        title = text,
                        enabled = logical,
                        canSpecifySecurityGroups = logical,
                        enabledSecurityGroups = list,
                        tenantSettingGroup = text
                    ],
                    List.Transform(
                        apiCall[tenantSettings],
                        each
                            {
                                _[settingName]?,
                                _[title]?,
                                Logical.From(_[enabled]?),
                                Logical.From(_[canSpecifySecurityGroups]?),
                                _[enabledSecurityGroups]?,
                                _[tenantSettingGroup]?
                            }
                    )
                ),
    documentation = [
        Documentation.Name = " get-TenantSettings.pq ",
        Documentation.Description = " Get all Tenant settings ",
        Documentation.Source = " https://www.datameerkat.com ",
        Documentation.Version = " 1.0 ",
        Documentation.Author = " Štěpán Rešl "
    ]
in
    Value.ReplaceType(
        output,
        Value.ReplaceMetadata(
            Value.Type(output),
            documentation
        )
    )