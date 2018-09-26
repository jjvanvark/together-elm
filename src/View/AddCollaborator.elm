module View.AddCollaborator exposing (view)

import App.Msg as AppMsg
import Collaborators.Model exposing (Model)
import Collaborators.Msg exposing (Msg(..))
import Navigation.Msg exposing (Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onWithOptions, onClick)
import Json.Decode as Json


view : Model -> Html AppMsg.Msg
view model =
    Html.form
        [ class "add-collaborator-form" ]
        [ fieldset
            []
            [ legend
                []
                [ text "Add collaborator" ]
            , label
                [ for "add-collaborator-email" ]
                [ text "email" ]
            , div
                [ class "input-group" ]
                [ input
                    [ id "add-collaborator-email"
                    , type_ "email"
                    , value model.addEmail
                    , onInput (\x -> AppMsg.Collaborators <| SetAddEmail x)
                    , disabled model.disabled
                    ]
                    []
                ]
            , div
                []
                [ input
                    [ type_ "submit"
                    , value "Add collaborator"
                    , loginFormClick <| AppMsg.Collaborators Check
                    , disabled model.disabled
                    ]
                    []
                , button
                    [ loginFormClick <|
                        AppMsg.Navigation CloseModal
                    ]
                    [ text "cancel" ]
                ]
            ]
        ]


loginFormClick : AppMsg.Msg -> Attribute AppMsg.Msg
loginFormClick msg =
    onWithOptions "click" { stopPropagation = False, preventDefault = True } (Json.succeed msg)
