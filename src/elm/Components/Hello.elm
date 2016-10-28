module Components.Hello exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
--import String

-- hello component
hello : model -> Html msg
hello model =
  div
    [ class "h1" ]
    [
      div [] [
        text "HELLO 8"
      ],
      div [] [
        text "HELLO 20"
      ]

    ]
