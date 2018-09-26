module View.Header exposing (header)

import Html exposing (Html, div, h2, text)
import Html.Attributes exposing (class)


header : Maybe String -> Html msg
header maybeHeading =
    div
        [ class "heading" ]
        [ h2
            [ class "heading__title" ]
            (case maybeHeading of
                Nothing ->
                    []

                Just value ->
                    [ text <| "Hello " ++ value ]
            )
        ]
