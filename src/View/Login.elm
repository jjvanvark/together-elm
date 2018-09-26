module View.Login exposing (view)

import App.Msg as AppMsg
import Login.Model exposing (Model)
import Login.Msg exposing (Msg(..))
import Json.Decode as Json
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onWithOptions)


view : Model -> Html AppMsg.Msg
view model =
    Html.form
        [ class "login-form" ]
        [ fieldset
            []
            [ legend
                []
                [ text "Login" ]
            , label
                [ for "login-email" ]
                [ text "email" ]
            , div
                [ class "input-group" ]
                [ input
                    [ id "login-email"
                    , type_ "email"
                    , value model.emailField
                    , onInput (\x -> AppMsg.Login <| SetEmail x)
                    , disabled model.disabled
                    ]
                    []
                ]
            , label
                [ for "login-password" ]
                [ text "password" ]
            , div
                [ class "input-group" ]
                [ input
                    [ id "login-password"
                    , type_ "password"
                    , value model.passwordField
                    , onInput (\x -> AppMsg.Login <| SetPassword x)
                    , disabled model.disabled
                    ]
                    []
                ]
            , div
                []
                [ input
                    [ type_ "submit"
                    , value "Send login"
                    , loginFormClick <| AppMsg.Login Check
                    , disabled model.disabled
                    ]
                    []
                ]
            ]
        ]


loginFormClick : AppMsg.Msg -> Attribute AppMsg.Msg
loginFormClick msg =
    onWithOptions "click" { stopPropagation = False, preventDefault = True } (Json.succeed msg)
