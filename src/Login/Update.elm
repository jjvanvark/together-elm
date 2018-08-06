module Login.Update exposing (update)

import App.Msg as AppMsg
import Login.Model exposing (Model)
import Login.Msg exposing (Msg(..))
import Login.Requests exposing (login)
import User.Requests exposing (start)
import Navigation.Msg as NavigationMsg
import Shared.Focus exposing (focus)
import Shared.Ports exposing (setToken)
import Shared.Task exposing (task)
import Regex exposing (regex, contains, Regex, caseInsensitive)


update : Msg -> Model -> ( Model, Cmd AppMsg.Msg )
update message model =
    case message of
        SetEmail value ->
            { model | emailField = value } ! []

        SetPassword value ->
            { model | passwordField = value } ! []

        SetHelp value ->
            { model | helpField = value } ! []

        Check ->
            let
                trimmedEmail =
                    String.trim model.emailField

                trimmedPassword =
                    String.trim model.passwordField
            in
                case emailValidation trimmedEmail of
                    False ->
                        { model | helpField = Just "Invalid email" } ! [ focus "login-email" ]

                    True ->
                        case trimmedPassword == "" of
                            True ->
                                { model | helpField = Just "Invalid password" } ! [ focus "login-password" ]

                            False ->
                                { model | helpField = Nothing, disabled = True }
                                    ! [ login trimmedEmail trimmedPassword ]

        ReceiveLogin (Err error) ->
            let
                _ =
                    Debug.log "ReceiveLogin error :: " error
            in
                { model
                    | token = Nothing
                    , disabled = False
                    , helpField = Just <| toString error
                }
                    ! [ focus "login-password" ]

        ReceiveLogin (Ok token) ->
            { model | token = Just token } ! [ setToken token, start token, task <| AppMsg.Navigation NavigationMsg.CloseModal ]


emailValidation : String -> Bool
emailValidation email =
    contains emailRegex email


emailRegex : Regex
emailRegex =
    caseInsensitive <|
        regex "^[A-Z0-9._%+-]{1,64}@(?:[A-Z0-9-]{1,63}\\.){1,125}[A-Z]{2,63}$"
