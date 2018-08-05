module App.Msg exposing (Msg(..))

import Login.Msg as Login


type Msg
    = NoOp
    | Login Login.Msg
