module Components.RadioBtn exposing (..)

import Html.Events exposing (onClick)
import Modal.Main exposing (TypeOption)
import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL


type alias Model =
    TypeOption



-- UPDATE


type Msg
    = TurnOn


update : Msg -> Model -> Model
update message model =
    case message of
        TurnOn ->
            { model | enabled = True }



-- View


radioBtn : Model -> Html Msg
radioBtn model =
    let
        btnClass =
            if model.enabled then
                "btn enabled"
            else
                "btn"
    in
        div
            [ class btnClass, onClick TurnOn ]
            [ text model.label
            ]
