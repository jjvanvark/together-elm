module Websockets.Update exposing (update)

import App.Msg as AppMsg
import Navigation.Msg as NavigationMsg
import Websockets.Model exposing (Model)
import Websockets.Msg exposing (Msg(..))
import Websockets.Types exposing (Carrier(..), CarrierLoad(..))
import User.Msg as UserMsg
import Shared.Focus exposing (focus)
import Shared.Task exposing (task)
import Navigation.Types as Modal
import Websockets.Types exposing (decodeCarrier, encodeSenderLoad, SenderLoad(..))
import Json.Decode exposing (decodeString)
import WebSocket


update : Msg -> Model -> String -> ( Model, Cmd AppMsg.Msg )
update message model token =
    case message of
        Send value ->
            model ! [ WebSocket.send "ws://localhost:9090/v1/ws" <| encodeSenderLoad token value ]

        NewMessage value ->
            case decodeString decodeCarrier value of
                Err error ->
                    let
                        _ =
                            Debug.log <| "Websocket newmessage error :: " ++ error
                    in
                        model ! []

                Ok carrier ->
                    case carrier of
                        Unauthorized ->
                            model ! [ task <| AppMsg.Navigation (NavigationMsg.OpenModal Modal.Login), focus "login-email" ]

                        Success value ->
                            case value of
                                Start start ->
                                    model
                                        ! [ Cmd.map AppMsg.User <| task <| UserMsg.SetUser start.user
                                          , Cmd.map AppMsg.User <| task <| UserMsg.SetCollaborators start.collaborators
                                          ]

                        ServerError ->
                            let
                                _ =
                                    Debug.log "error" "Websocket server error"
                            in
                                model ! []
