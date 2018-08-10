module User.Requests exposing (start)

import App.Msg as AppMsg
import User.Msg exposing (Msg(ReceiveStart))
import User.Types.Start exposing (Start, decodeStart)
import Shared.Constants exposing (url)
import Http exposing (send, Request, emptyBody, expectJson, request)


start : Cmd AppMsg.Msg
start =
    Cmd.map AppMsg.User <|
        send ReceiveStart <|
            sendStart


sendStart : Request Start
sendStart =
    request
        { method = "GET"
        , headers = []
        , url = url "/start"
        , body = emptyBody
        , expect = expectJson decodeStart
        , timeout = Nothing
        , withCredentials = True
        }
