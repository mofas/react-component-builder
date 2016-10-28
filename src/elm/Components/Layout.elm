module Components.Layout exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
--import String

-- codeGenerator component
layout : Html msg -> Html msg
layout children =
  div
    [ class "app-container" ]
    [
      div
        [ class "navbar" ]
        [ text "React Component Builder" ]
    ,  children
    ]

