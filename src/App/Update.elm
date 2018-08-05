module App.Update exposing (update)

import App.Model exposing (Model)
import App.Msg exposing (Msg(..))
import Login.Update as Login


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        NoOp ->
            model ! []

        Login msg ->
            let
                ( updatedModel, appMsg ) =
                    Login.update msg model.login
            in
                { model | login = updatedModel } ! [ appMsg ]
