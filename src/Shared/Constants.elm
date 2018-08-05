module Shared.Constants exposing (url)


url : String -> String
url value =
    "http://localhost:9090/v1" ++ value
