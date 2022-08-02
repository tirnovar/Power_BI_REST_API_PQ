let
    output =
        (generatedToken as text, startDate as date, endDate) =>
            let
                listofDates =
                    List.Dates(
                        startDate,
                        Number.From(endDate - startDate),
                        #duration(1, 0, 0, 0)
                    ),
                transformator =
                    List.Transform(
                        listofDates,
                        each
                            let
                                startDateTimeVariable =
                                    "'"
                                    & Date.ToText(
                                        _,
                                        "yyyy-MM-ddT00:00:00.000Z"
                                    )
                                    & "'",
                                endDateTimeVariable =
                                    "'"
                                    & Date.ToText(
                                        _,
                                        "yyyy-MM-ddT23:59:59.999Z"
                                    )
                                    & "'",
                                apiCall =
                                    Json.Document(
                                        Web.Contents(
                                            "https://api.powerbi.com/v1.0/myorg",
                                            [
                                                RelativePath = "admin/activityevents",
                                                Headers = [
                                                    #"Content-Type" = "application/json",
                                                    Authorization = generatedToken
                                                ],
                                                Query = [
                                                    startDateTime = startDateTimeVariable,
                                                    endDateTime = endDateTimeVariable
                                                ]
                                            ]
                                        )
                                    ),
                                generator =
                                    List.Buffer(
                                        List.Generate(
                                            () =>
                                                [
                                                    result = apiCall,
                                                    uri = result[continuationUri]?,
                                                    lastResultSet = result[lastResultSet]?
                                                ],
                                            each [uri] <> null,
                                            each
                                                [
                                                    result =
                                                        Json.Document(
                                                            Web.Contents(
                                                                uri,
                                                                [
                                                                    Headers = [
                                                                        #"Content-Type" = "application/json",
                                                                        Authorization = generatedToken
                                                                    ]
                                                                ]
                                                            )
                                                        ),
                                                    uri = _[result][continuationUri]?,
                                                    lastResultSet = _[result][lastResultSet]?
                                                ],
                                            each [result][activityEventEntities]?
                                        )
                                    ),
                                convertor = List.RemoveNulls(List.Combine(generator))
                            in
                                convertor
                    ),
                listOutputConvertor = List.RemoveNulls(List.Combine(transformator))
            in
                #table(
                    type table [content = record],
                    List.Transform(
                        listOutputConvertor,
                        each
                            {
                                _
                            }
                    )
                ),
    documentation = [
        Documentation.Name = " get-ActivityEvents.pq ",
        Documentation.Description = " Get All activity events from selected date ",
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