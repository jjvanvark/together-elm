module App.Model exposing (Model, initialModel)

import Login.Model as Login
import User.Model as User
import Navigation.Model as Navigation
import Websockets.Model as Websockets
import Websockets.Model as Websockets
import Collaborators.Model as Collaborators


type alias Model =
    { login : Login.Model
    , user : User.Model
    , navigation : Navigation.Model
    , websockets : Websockets.Model
    , collaborators : Collaborators.Model
    }


initialModel : Maybe String -> Model
initialModel token =
    { login = Login.initialModel token
    , user = User.initialModel
    , navigation = Navigation.initialModel
    , websockets = Websockets.initialModel
    , collaborators = Collaborators.initialModel
    }
