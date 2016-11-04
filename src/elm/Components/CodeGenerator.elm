module Components.CodeGenerator exposing (..)

import Json.Encode
import Html exposing (..)
import Html.Attributes exposing (..)


-- Update


type Msg
    = Noop



-- View


codeGenerator : String -> Html Msg
codeGenerator code =
    div
        [ class "code-generator-section" ]
        [ pre
            [ class "code-snippet", property "innerHTML" (Json.Encode.string code) ]
            []
        ]
