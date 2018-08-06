module Navigation.Msg exposing (Msg(..))

import Navigation.Types exposing (Modal)


type Msg
    = OpenModal Modal
    | CloseModal
