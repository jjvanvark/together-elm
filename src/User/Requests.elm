module User.Requests exposing (start)

import App.Msg as AppMsg
import User.Msg exposing (Msg(ReceiveStart))
import User.Types.Start exposing (Start, decodeStart)
import Shared.Constants exposing (url)
import Http exposing (send, Request, emptyBody, expectJson, request, header)


start : Maybe String -> Cmd AppMsg.Msg
start maybeToken =
    Cmd.map AppMsg.User <|
        send ReceiveStart <|
            sendStart <|
                Maybe.withDefault "" maybeToken


sendStart : String -> Request Start
sendStart token =
    request
        { method = "GET"
        , headers = [ header "Authorization" token ]
        , url = url "/start"
        , body = emptyBody
        , expect = expectJson decodeStart
        , timeout = Nothing
        , withCredentials = True
        }
