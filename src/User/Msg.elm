module User.Msg exposing (Msg(..))

import User.Types.User exposing (User)
import User.Types.Collaborator exposing (Collaborator)
import User.Types.Start exposing (Start)
import Http exposing (Error)


type Msg
    = ReceiveStart (Result Error Start)
    | SetUser User
    | SetCollaborators (List Collaborator)
