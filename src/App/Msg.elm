module App.Msg exposing (Msg(..))

import Login.Msg as Login
import User.Msg as User
import Navigation.Msg as Navigation
import Websockets.Msg as Websockets
import Collaborators.Msg as Collaborators


type Msg
    = NoOp
    | Login Login.Msg
    | User User.Msg
    | Navigation Navigation.Msg
    | Websockets Websockets.Msg
    | Collaborators Collaborators.Msg
