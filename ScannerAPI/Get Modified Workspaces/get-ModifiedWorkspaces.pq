let
    output =
        (generatedToken as text, sinceDateTime as datetime, optional withPersonalWorkspaces as logical) =>
            let
                excluder = try if not withPersonalWorkspaces then "False" else "True" otherwise "True",
                converted =
                    DateTime.ToText(
                        sinceDateTime,
                        "yyyy-MM-ddTHH:mm:ss.0000000Z"
                    ),
                apiCall =
                    Json.Document(
                        Web.Contents(
                            "https://api.powerbi.com/v1.0/myorg",
                            [
                                RelativePath = "admin/workspaces/modified",
                                Query = [
                                    modifiedSince = converted,
                                    excludePersonalWorkspaces = excluder
                                ],
                                Headers = [
                                    #"Content-Type" = "application/json",
                                    Authorization = generatedToken
                                ]
                            ]
                        )
                    ),
                combiner =
                    #table(
                        type table [WorkspaceId = text],
                        List.Transform(
                            List.Buffer(apiCall),
                            each
                                {
                                    _[id]
                                }
                        )
                    )
            in
                combiner,
    documentation = [
        Documentation.Name = " get-ModifiedWorkspaces.pq ",
        Documentation.Description = " Get Modified Workspaces  ",
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