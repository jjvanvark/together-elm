module App.Model exposing (Model, initialModel)

import Login.Model as Login


type alias Model =
    { login : Login.Model }


initialModel : Model
initialModel =
    { login = Login.initialModel }
