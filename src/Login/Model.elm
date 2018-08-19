module Login.Model exposing (Model, initialModel)


type alias Model =
    { emailField : String
    , passwordField : String
    , helpField : Maybe String
    , disabled : Bool
    , token : Maybe String
    }


initialModel : Maybe String -> Model
initialModel token =
    { emailField = "joostvanvark@gmail.com"
    , passwordField = "joost"
    , helpField = Nothing
    , disabled = False
    , token = token
    }
