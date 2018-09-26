module Main exposing (..)

import App.Model exposing (Model, initialModel)
import App.Msg as AppMsg exposing (Msg)
import App.Update exposing (update)
import Websockets.Msg as WebsocketsMsg
import Websockets.Types exposing (SenderLoad(..))
import View.View exposing (view)
import Html exposing (programWithFlags)
import Shared.Task exposing (task)
import Html exposing (program)
import WebSocket


-- Init


type alias Flag =
    { token : Maybe String }


init : Flag -> ( Model, Cmd Msg )
init flag =
    initialModel flag.token ! [ task <| AppMsg.Websockets <| WebsocketsMsg.Send SendStart ]



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map AppMsg.Websockets <|
        WebSocket.listen "ws://localhost:9090/v1/ws" WebsocketsMsg.NewMessage



-- Program


main =
    programWithFlags
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
