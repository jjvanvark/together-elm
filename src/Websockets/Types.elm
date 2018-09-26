module Websockets.Types exposing (Carrier(..), decodeCarrier, CarrierLoad(..), decodeCarrierLoad, Sender, SenderLoad(..), encodeSenderLoad)

import User.Types.Start exposing (Start, decodeStart)
import Json.Decode exposing (Decoder, field, string, andThen, fail)
import Json.Decode.Pipeline exposing (decode)
import Json.Encode as Encode


type alias Sender =
    { token : String
    , load : SenderLoad
    }


type SenderLoad
    = SendStart
    | SendAddCollaborator String


encodeSenderLoad : String -> SenderLoad -> String
encodeSenderLoad token load =
    let
        ( loader, values ) =
            case load of
                SendStart ->
                    ( "start", [] )

                SendAddCollaborator email ->
                    ( "add-collaborator", [ ( "email", Encode.string email ) ] )
    in
        Encode.encode 0 <|
            Encode.object <|
                [ ( "token", Encode.string token )
                , ( "load", Encode.string loader )
                ]
                    ++ values


type Carrier
    = Success CarrierLoad
    | Unauthorized
    | ServerError


decodeCarrier : Decoder Carrier
decodeCarrier =
    field "status" string
        |> andThen decodeCarrier_


decodeCarrier_ : String -> Decoder Carrier
decodeCarrier_ status =
    case status of
        "success" ->
            decodeCarrierLoad
                |> andThen (\x -> decode (Success x))

        "unauthorized" ->
            decode Unauthorized

        "server_error" ->
            decode ServerError

        somethingElse ->
            fail <|
                "There is no carrier status with type : "
                    ++ somethingElse


type CarrierLoad
    = Start Start


decodeCarrierLoad : Decoder CarrierLoad
decodeCarrierLoad =
    field "load" string
        |> andThen decodeCarrierLoad_


decodeCarrierLoad_ : String -> Decoder CarrierLoad
decodeCarrierLoad_ type_ =
    case type_ of
        "start" ->
            decodeStart
                |> andThen (\x -> decode (Start x))

        somethingElse ->
            fail <|
                "No carrierload type with : "
                    ++ somethingElse
