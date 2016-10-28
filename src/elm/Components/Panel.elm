module Components.Panel exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
--import String

panel : model -> Html msg
panel model =
  div
    [ class "panel-section" ]
    [
      text "Panel"
    ]
