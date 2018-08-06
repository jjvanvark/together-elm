module App.Model exposing (Model, initialModel)

import Login.Model as Login
import User.Model as User


type alias Model =
    { login : Login.Model
    , user : User.Model
    }


initialModel : Maybe String -> Model
initialModel token =
    { login = Login.initialModel token
    , user = User.initialModel
    }
