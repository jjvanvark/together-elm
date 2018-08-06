module Navigation.Model exposing (Model, initialModel)

import Navigation.Types exposing (Modal)


type alias Model =
    { modal : Maybe Modal }


initialModel : Model
initialModel =
    { modal = Nothing }
