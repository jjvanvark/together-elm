module App.Model exposing (Model, initialModel)

import Login.Model as Login
import User.Model as User
import Navigation.Model as Navigation


type alias Model =
    { login : Login.Model
    , user : User.Model
    , navigation : Navigation.Model
    }


initialModel : Model
initialModel =
    { login = Login.initialModel
    , user = User.initialModel
    , navigation = Navigation.initialModel
    }
