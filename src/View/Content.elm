module View.Content exposing (content)

import Html exposing (..)
import Html.Attributes exposing (..)


content : String -> Html msg
content value =
    section
        [ class "content-panel" ]
        [ textarea
            [ class "content-textarea"
            ]
            []
        ]
