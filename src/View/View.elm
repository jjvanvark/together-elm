module View.View exposing (view)

import App.Model exposing (Model)
import App.Msg exposing (Msg)
import User.Types.User exposing (User)
import Navigation.Types exposing (Modal(..))
import View.Login as Login
import View.AddCollaborator as AddCollaborator
import Html exposing (..)
import Html.Attributes exposing (class)
import View.Modal.Modal as Modal
import View.Header exposing (header)
import View.Collaborators exposing (collaborators)


view : Model -> Html Msg
view model =
    div
        [ class "main-panel" ]
        ([ parseHeader model.user.user
         , collaborators model.user.collaborators
         ]
            ++ showModal model
        )


parseHeader : Maybe User -> Html msg
parseHeader maybeUser =
    View.Header.header <|
        case maybeUser of
            Nothing ->
                Nothing

            Just value ->
                Just value.name


showModal : Model -> List (Html Msg)
showModal model =
    case model.navigation.modal of
        Nothing ->
            []

        Just modal ->
            [ Modal.modal <|
                case modal of
                    Login ->
                        Login.view model.login

                    AddCollaborator ->
                        AddCollaborator.view model.collaborators
            ]
