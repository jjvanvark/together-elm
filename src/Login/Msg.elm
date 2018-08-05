module Login.Msg exposing (Msg(..))

import Http exposing (Error)


type Msg
    = SetEmail String
    | SetPassword String
    | SetHelp (Maybe String)
    | Check
    | ReceiveLogin (Result Error String)
