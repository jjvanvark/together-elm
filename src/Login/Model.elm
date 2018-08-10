module Login.Model exposing (Model, initialModel)


type alias Model =
    { emailField : String
    , passwordField : String
    , helpField : Maybe String
    , disabled : Bool
    }


initialModel : Model
initialModel =
    { emailField = "joostvanvark@gmail.com"
    , passwordField = "joost"
    , helpField = Nothing
    , disabled = False
    }
