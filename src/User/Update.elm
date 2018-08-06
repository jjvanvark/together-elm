module User.Update exposing (update)

import App.Msg as AppMsg
import User.Model exposing (Model)
import User.Msg exposing (Msg(..))
import Navigation.Msg as NavigationMsg
import Navigation.Types as Modal
import Shared.Task exposing (task)
import Http exposing (Error(..))


update : Msg -> Model -> ( Model, Cmd AppMsg.Msg )
update message model =
    case message of
        ReceiveStart (Err error) ->
            case checkStatus 401 error of
                True ->
                    model ! [ task <| AppMsg.Navigation (NavigationMsg.OpenModal Modal.Login) ]

                False ->
                    model ! []

        ReceiveStart (Ok value) ->
            { model
                | user = Just value.user
                , collaborators = Just value.collaborators
            }
                ! []


checkStatus : Int -> Error -> Bool
checkStatus status error =
    case error of
        BadStatus value ->
            value.status.code == status

        somethingElse ->
            False
