module Components.CodeGenerator exposing (..)

import Json.Encode
import Html.Events exposing (onClick)
import Html exposing (..)
import Html.Attributes exposing (..)


-- Update


type Msg
    = CopyCode String



-- View


codeGenerator : String -> String -> Html Msg
codeGenerator code syntaxHighLightedCode =
    div
        [ class "code-generator-section" ]
        [ pre
            [ class "code-snippet", property "innerHTML" (Json.Encode.string syntaxHighLightedCode) ]
            []
        , textarea [ id "raw-code", value code, style [ ( "opacity", "0" ), ( "position", "absolute" ) ] ] []
        , div [ class "copy-btn", onClick (CopyCode "raw-code") ] [ text "Copy Code" ]
        ]
