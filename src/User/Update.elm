module User.Update exposing (update)

import App.Msg as AppMsg
import User.Model exposing (Model)
import User.Msg exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd AppMsg.Msg )
update message model =
    case message of
        ReceiveStart (Err error) ->
            let
                _ =
                    Debug.log "ReceiveStart error :: " error
            in
                model ! []

        ReceiveStart (Ok value) ->
            { model
                | user = Just value.user
                , collaborators = Just value.collaborators
            }
                ! []
