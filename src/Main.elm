module Main exposing (..)

import App.Model exposing (Model, initialModel)
import App.Msg exposing (Msg)
import App.Update exposing (update)
import User.Requests exposing (start)
import View.View exposing (view)
import Html exposing (programWithFlags)


-- Init


type alias Flag =
    { token : Maybe String }


init : Flag -> ( Model, Cmd Msg )
init flag =
    initialModel flag.token ! [ start flag.token ]



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- Program


main =
    programWithFlags
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
