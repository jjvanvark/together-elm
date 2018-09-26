module View.Modal.Modal exposing (modal)

import Html exposing (Html, div)
import Html.Attributes exposing (class)


modal : Html msg -> Html msg
modal child =
    div
        [ class "modal-backdrop" ]
        [ div
            [ class "modal-panel" ]
            [ child ]
        ]
