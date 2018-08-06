module App.Update exposing (update)

import App.Model exposing (Model)
import App.Msg exposing (Msg(..))
import Login.Update as Login
import User.Update as User
import Navigation.Update as Navigation


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

        User msg ->
            let
                ( updatedModel, appMsg ) =
                    User.update msg model.user
            in
                { model | user = updatedModel } ! [ appMsg ]

        Navigation msg ->
            let
                ( updatedModel, appMsg ) =
                    Navigation.update msg model.navigation
            in
                { model | navigation = updatedModel } ! [ appMsg ]
