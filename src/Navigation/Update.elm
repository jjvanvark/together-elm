module Navigation.Update exposing (update)

import App.Msg as AppMsg
import Navigation.Model exposing (Model)
import Navigation.Msg exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd AppMsg.Msg )
update message model =
    case message of
        OpenModal modal ->
            { model | modal = Just modal } ! []

        CloseModal ->
            { model | modal = Nothing } ! []
