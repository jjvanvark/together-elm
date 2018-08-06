module User.Types.Collaborator exposing (Collaborator, decodeCollaborator)

import Json.Decode exposing (Decoder, string)
import Json.Decode.Pipeline exposing (decode, required)


type alias Collaborator =
    { id : String
    , email : String
    , name : String
    , content : String
    }


decodeCollaborator : Decoder Collaborator
decodeCollaborator =
    decode Collaborator
        |> required "id" string
        |> required "email" string
        |> required "name" string
        |> required "content" string
