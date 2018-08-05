module Shared.Focus exposing (focus)

import Dom
import App.Msg exposing (Msg(NoOp))
import Task exposing (attempt)


focus : String -> Cmd Msg
focus id =
    attempt (\_ -> NoOp) <| Dom.focus id
