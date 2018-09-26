module View.Collaborators exposing (collaborators)

import App.Msg as AppMsg
import Navigation.Msg as NavigationMsg
import Navigation.Types exposing (Modal(..))
import User.Types.Collaborator exposing (Collaborator)
import Html.Events exposing (onClick)
import Html exposing (..)
import Html.Attributes exposing (..)


collaborators : Maybe (List Collaborator) -> Html AppMsg.Msg
collaborators maybeColls =
    section
        [ class "collaborators" ]
        (case maybeColls of
            Nothing ->
                [ header True ]

            Just colls ->
                [ header False
                , ul
                    [ class "collaborators-list" ]
                    (List.map renderItem colls)
                ]
        )


renderItem : Collaborator -> Html AppMsg.Msg
renderItem collaborator =
    li
        [ class "item" ]
        [ span
            [ class "item__title" ]
            [ text collaborator.name ]
        , span
            [ class "item__icon" ]
            [ button
                [ class "item__button" ]
                [ text "remove" ]
            ]
        ]


header : Bool -> Html AppMsg.Msg
header disabled_ =
    div
        [ class "collaborators__heading" ]
        [ text "Collaborators"
        , button
            [ class "collaboratos__add-button"
            , disabled disabled_
            , onClick <| AppMsg.Navigation <| NavigationMsg.OpenModal AddCollaborator
            ]
            [ text "Add" ]
        ]
