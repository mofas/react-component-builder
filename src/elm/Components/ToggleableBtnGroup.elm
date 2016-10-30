module Components.ToggleableBtnGroup exposing (..)

import Html.App
import Components.ToggleableBtn exposing (toggleableBtn)
import Modal.Main exposing (TypeOptionList)
import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL


type alias Model =
    TypeOptionList



-- UPDATE


type Msg
    = ToggleBtnMsg Components.ToggleableBtn.Msg


update : Msg -> Model -> Model
update message typeOptionList =
    case message of
        ToggleBtnMsg subMsg ->
            let
                updater target =
                    if target.key == "FIX_ME" then
                        Components.ToggleableBtn.update subMsg target
                    else
                        target
            in
                List.map updater
                    typeOptionList



-- View


toggleableBtnGroup : Model -> Html Msg
toggleableBtnGroup model =
    let
        btnGroup =
            List.map (\x -> (Html.App.map ToggleBtnMsg (toggleableBtn x))) model
    in
        div
            [ class "btn-group" ]
            btnGroup
