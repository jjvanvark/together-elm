module Collaborators.Update exposing (update)

import App.Msg as AppMsg
import Collaborators.Model exposing (Model)
import Collaborators.Msg exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd AppMsg.Msg )
update message model =
    case message of
        SetAddEmail email ->
            { model | addEmail = email } ! []

        Check ->
            model ! []
