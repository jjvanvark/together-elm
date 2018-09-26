module Websockets.Msg exposing (Msg(..))

import Websockets.Types exposing (SenderLoad)


type Msg
    = Send SenderLoad
    | NewMessage String
