let
    fct =
        (generatedToken as text, groupId as text, reportId) =>
            let
                apiCall =
                    Web.Contents(
                        "https://api.powerbi.com/v1.0/myorg/groups",
                        [
                            RelativePath = groupId & "/reports/" & reportId & "/Export",
                            Headers = [
                                #"Content-Type" = "application/zip",
                                Authorization = generatedToken
                            ]
                        ]
                    ),
                decompresor = decompres(apiCall),
                //decompres funcion you can get from https://github.com/ibarrau/PowerBi-code/blob/master/PowerQuery/ExtractZIP.pq
                filter =
                    Table.SelectRows(
                        decompresor,
                        each ([FileName] = "Report/Layout")
                    ),
                extractor =
                    let
                        insert =
                            Table.AddColumn(
                                filter,
                                "jsonReady",
                                each
                                    Json.Document(
                                        Text.FromBinary(
                                            [Content],
                                            TextEncoding.Utf16
                                        )
                                    )
                            ),
                        initialList = List.Buffer(insert[jsonReady]{0}?[sections]?)
                    in
                        #table(
                            type table [
                                reportPage = text,
                                visuals
                            ],
                            List.Transform(
                                initialList,
                                each
                                    {
                                        _[displayName]?,
                                        if _[visualContainers]? = null then
                                            null
                                        else
                                            let
                                                init = List.Buffer(_[visualContainers]?),
                                                output =
                                                    List.Transform(
                                                        init,
                                                        each
                                                            let
                                                                jsonResponse = Json.Document(_[config]?)
                                                            in
                                                                [
                                                                    visualId = jsonResponse[name],
                                                                    nameOfVisual =
                                                                        let
                                                                            name = jsonResponse[singleVisual][vcObjects]?[title]?{0}?[properties]?[text]?[expr]?[Literal]?[Value]?
                                                                        in
                                                                            try Text.BetweenDelimiters(name, "'", "'") otherwise null,
                                                                    visualType = jsonResponse[singleVisual][visualType],
                                                                    other = jsonResponse
                                                                ]
                                                    )
                                            in
                                                output
                                    }
                            )
                        ),
                expandToRows =
                    Table.ExpandListColumn(
                        extractor,
                        "visuals"
                    ),
                expandVisuals =
                    Table.Buffer(
                        Table.ExpandRecordColumn(
                            expandToRows,
                            "visuals",
                            {
                                "visualId",
                                "nameOfVisual",
                                "visualType"
                            },
                            {
                                "visualId",
                                "nameOfVisual",
                                "visualType"
                            }
                        )
                    ),
                groupsRemover =
                    Table.RemoveRowsWithErrors(
                        expandVisuals,
                        {"visualType"}
                    )
            in
                groupsRemover,
    documentation = [
        Documentation.Name = " get-VisualsOfReport.pq ",
        Documentation.Description = " Get visual of selected report. This Report CAN NOT BE AFTER REBINDING!!!!",
        Documentation.Source = "https://www.jaknapowerbi.cz",
        Documentation.Version = " 1.0 ",
        Documentation.Author = " Štěpán Rešl "
    ]
in
    Value.ReplaceType(
        fct,
        Value.ReplaceMetadata(
            Value.Type(fct),
            documentation
        )
    )