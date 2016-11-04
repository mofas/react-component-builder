module Components.CodeGenerator exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Modal.Main exposing (AppModel, TypeOptionList)
import Components.GetTemplateCode exposing (getTemplateCode)


-- Update


type Msg
    = Noop



-- View


codeGenerator : AppModel -> Html Msg
codeGenerator model =
    div
        [ class "code-generator-section" ]
        [ pre
            [ class "code-snippet" ]
            [ text (getTemplateCode model) ]
        ]
