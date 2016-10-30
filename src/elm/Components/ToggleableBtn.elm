module Components.ToggleableBtn exposing (..)

import Html.Events exposing (onClick)
import Modal.Main exposing (TypeOption)
import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL
-- UPDATE


type Msg
    = Toggle


update : Msg -> TypeOption -> TypeOption
update message model =
    case message of
        Toggle ->
            { model | enabled = not model.enabled }



-- View


toggleableBtn : TypeOption -> Html Msg
toggleableBtn model =
    let
        btnClass =
            if model.enabled then
                "btn enabled"
            else
                "btn"
    in
        div
            [ class btnClass, onClick Toggle ]
            [ text model.label
            ]
