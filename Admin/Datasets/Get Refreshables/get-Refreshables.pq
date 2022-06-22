let
    output =
        (generatedToken as text, datasetId as text) =>
            let
                apiCall =
                    Json.Document(
                        Web.Contents(
                            "https://api.powerbi.com/v1.0/myorg",
                            [
                                RelativePath = "admin/capacities/refreshables",
                                Query = [
                                    #"$expand" = "capacity,group"
                                ],
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
                        kind = text,
                        startTime = datetime,
                        endTime = datetime,
                        refreshCount = number,
                        refreshFailures = number,
                        averageDuration = number,
                        medianDuration = number,
                        refreshesPerDay = number,
                        lastRefresh = record,
                        refreshSchedule.days = list,
                        refreshSchedule.times = list,
                        refreshSchedule.enabled = logical,
                        refreshSchedule.localTimeZoneId = text,
                        refreshSchedule.notifyOption = text,
                        configuredBy = text,
                        capacity = record,
                        group = record
                    ],
                    List.Transform(
                        apiCall[value],
                        each
                            {
                                _[id]?,
                                _[name]?,
                                _[kind]?,
                                _[startTime]?,
                                _[endTime]?,
                                _[refreshCount]?,
                                _[refreshFailures]?,
                                _[averageDuration]?,
                                _[medianDuration]?,
                                _[refreshesPerDay]?,
                                _[lastRefresh]?,
                                _[refreshSchedule]?[days]?,
                                _[refreshSchedule]?[times]?,
                                _[refreshSchedule]?[enabled]?,
                                _[refreshSchedule]?[localTImeZoneId]?,
                                _[refreshSchedule]?[notifyOption]?,
                                _[configuredBy]?{0}?,
                                _[capacity]?,
                                _[group]?
                            }
                    )
                ),
    documentation = [
        Documentation.Name = " get-LastDatasetRefreshErrorByLast10Refreshes.pq ",
        Documentation.Description = " Get the newest Error on refresh dataset by last 10 refreshes ",
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