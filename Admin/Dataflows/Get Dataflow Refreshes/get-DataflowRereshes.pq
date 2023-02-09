let
    output =
        (generatedToken as text, groupId as text, dataflowId as text) =>
            let
                apiCall =
                    Json.Document(
                        Web.Contents(
                            "https://api.powerbi.com/v1.0/myorg",
                            [
                                RelativePath = "groups/"& groupId &"/dataflows/"&dataflowId&"/transactions",
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
                        refreshType = text,
                        startTime = text,
                        endTime = text,
                        status = text
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[refreshType]?,
                                DateTime.From(_[startTime]?),
                                DateTime.From(_[endTime]?),
                                _[status]?
                            }
                    )
                ),
    documentation = [
        Documentation.Name = " get-DatalowRefreshes.pq ",
        Documentation.Description = " Get all dataflows as admin ",
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