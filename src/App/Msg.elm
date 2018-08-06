module App.Msg exposing (Msg(..))

import Login.Msg as Login
import User.Msg as User
import Navigation.Msg as Navigation


type Msg
    = NoOp
    | Login Login.Msg
    | User User.Msg
    | Navigation Navigation.Msg
