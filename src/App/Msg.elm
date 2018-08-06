module App.Msg exposing (Msg(..))

import Login.Msg as Login
import User.Msg as User


type Msg
    = NoOp
    | Login Login.Msg
    | User User.Msg
