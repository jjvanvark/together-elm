module User.Update exposing (update)

import App.Msg as AppMsg
import User.Model exposing (Model)
import User.Msg exposing (Msg(..))
import Navigation.Msg as NavigationMsg
import Navigation.Types as Modal
import Shared.Focus exposing (focus)
import Shared.Task exposing (task)
import Http exposing (Error(..))


update : Msg -> Model -> ( Model, Cmd AppMsg.Msg )
update message model =
    case message of
        SetUser user ->
            { model | user = Just user } ! []

        SetCollaborators collaborators ->
            { model | collaborators = Just collaborators } ! []

        ReceiveStart (Err error) ->
            case checkStatus 401 error of
                True ->
                    model ! [ task <| AppMsg.Navigation (NavigationMsg.OpenModal Modal.Login), focus "login-email" ]

                False ->
                    model ! []

        ReceiveStart (Ok value) ->
            model ! []


checkStatus : Int -> Error -> Bool
checkStatus status error =
    case error of
        BadStatus value ->
            value.status.code == status

        somethingElse ->
            False
