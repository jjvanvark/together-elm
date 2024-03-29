module Navigation.Update exposing (update)

import App.Msg as AppMsg
import Navigation.Model exposing (Model)
import Navigation.Msg exposing (Msg(..))
import Navigation.Types exposing (Modal(..))
import Shared.Focus exposing (focus)


update : Msg -> Model -> ( Model, Cmd AppMsg.Msg )
update message model =
    case message of
        OpenModal modal ->
            { model | modal = Just modal }
                ! case modal of
                    AddCollaborator ->
                        [ focus "add-collaborator-email" ]

                    Login ->
                        [ focus "login-email" ]

        CloseModal ->
            { model | modal = Nothing } ! []
