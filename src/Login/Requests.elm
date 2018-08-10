module Login.Requests exposing (login)

import App.Msg as AppMsg
import Login.Msg exposing (Msg(ReceiveLogin))
import Shared.Constants exposing (url)
import Http exposing (send, request, jsonBody, expectString, Request)
import Json.Encode as Json


login : String -> String -> Cmd AppMsg.Msg
login email password =
    Cmd.map AppMsg.Login <|
        send ReceiveLogin <|
            sendLogin email password


sendLogin : String -> String -> Request String
sendLogin email password =
    request
        { method = "POST"
        , headers = []
        , url = url "/login"
        , body =
            jsonBody <|
                Json.object
                    [ ( "email", Json.string email )
                    , ( "password", Json.string password )
                    ]
        , expect = expectString
        , timeout = Nothing
        , withCredentials = True
        }
