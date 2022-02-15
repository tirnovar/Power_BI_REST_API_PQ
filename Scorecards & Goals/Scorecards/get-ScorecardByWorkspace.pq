let
    output =
        (generatedToken as text, workspaceId as text) =>
            let
                apiCall =
                    Json.Document(
                        Web.Contents(
                            "https://api.powerbi.com/v1.0/myorg",
                            [
                                RelativePath = "groups/" & workspaceId & "/scorecards",
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
                        id = text,
                        name = text,
                        contact = text,
                        lastModifiedBy = text,
                        createdTime = datetime,
                        lastModifiedTime = datetime,
                        provisioningStatus = text,
                        groupId = text,
                        datasetId = text,
                        reportId = text,
                        statuses = list,
                        permissions = text,
                        columnSettings = list
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[name]?,
                                _[contact]?,
                                _[lastModifiedBy]?,
                                _[createdTime]?,
                                _[lastModifiedTime]?,
                                _[provisioningStatus]?,
                                _[groupId]?,
                                _[datasetId]?,
                                _[reportId]?,
                                _[statuses]?,
                                _[permissions]?,
                                _[columnSettings]?
                            }
                    )
                ),
    documentation = [
        Documentation.Name = " get-ScorecardsByWorkspace.pq ",
        Documentation.Description = " Get scorecards by workspace ID (returns results only for workspaces whare UserPrincipal has access) ",
        Documentation.Source = "https://www.jaknapowerbi.cz",
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