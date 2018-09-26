module Collaborators.Model exposing (Model, initialModel)


type alias Model =
    { addEmail : String
    , disabled : Bool
    }


initialModel : Model
initialModel =
    { addEmail = ""
    , disabled = False
    }
