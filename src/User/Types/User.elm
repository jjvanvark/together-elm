module User.Types.User exposing (User, decodeUser)

import Json.Decode exposing (Decoder, string)
import Json.Decode.Pipeline exposing (decode, required)


type alias User =
    { id : String
    , email : String
    , name : String
    , content : String
    }


decodeUser : Decoder User
decodeUser =
    decode User
        |> required "id" string
        |> required "email" string
        |> required "name" string
        |> required "content" string
