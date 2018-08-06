module User.Types.Start exposing (Start, decodeStart)

import User.Types.User exposing (User, decodeUser)
import User.Types.Collaborator exposing (Collaborator, decodeCollaborator)
import Json.Decode exposing (Decoder, list)
import Json.Decode.Pipeline exposing (decode, required)


type alias Start =
    { user : User
    , collaborators : List Collaborator
    }


decodeStart : Decoder Start
decodeStart =
    decode Start
        |> required "user" decodeUser
        |> required "collaborators" (list decodeCollaborator)
