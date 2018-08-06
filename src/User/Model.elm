module User.Model exposing (Model, initialModel)

import User.Types.User exposing (User)
import User.Types.Collaborator exposing (Collaborator)


type alias Model =
    { user : Maybe User
    , collaborators : Maybe (List Collaborator)
    }


initialModel : Model
initialModel =
    { user = Nothing
    , collaborators = Nothing
    }
