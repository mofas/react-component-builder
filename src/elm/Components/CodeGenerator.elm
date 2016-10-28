module Components.CodeGenerator exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
--import String

codeGenerator : model -> Html msg
codeGenerator model =
  div
    [ class "code-generator-section" ]
    [
      text "Code Generator"
    ]
