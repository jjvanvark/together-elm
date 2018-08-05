module Main exposing (..)

import App.Model exposing (Model, initialModel)
import App.Msg exposing (Msg)
import App.Update exposing (update)
import View.View exposing (view)
import Html exposing (program)


-- Init


init : ( Model, Cmd Msg )
init =
    initialModel ! []



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- Program


main =
    program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }