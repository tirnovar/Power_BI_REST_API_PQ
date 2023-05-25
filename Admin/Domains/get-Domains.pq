let
    output =
        (generatedToken as text) =>
            let
                apiCall =
                    Json.Document(
                        Web.Contents(
                            "https://api.powerbi.com/v1.0/myorg",
                            [
                                RelativePath = "admin/domains",
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
                        objectId = text,
                        displayName = text,
                        description = text
                    ],
                    List.Transform(
                        apiCall[domains],
                        each
                            {
                                _[objectId]?,
                                _[displayName]?,
                                _[description]?
                            }
                    )
                ),
    documentation = [
        Documentation.Name = " get-Domains.pq ",
        Documentation.Description = " Get all domains to tentant ",
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