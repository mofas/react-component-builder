module Components.ToggleableBtnGroup exposing (..)

import Components.ToggleableBtn exposing (toggleableBtn)
import Modal.Main exposing (TypeOptionId, TypeOptionList)
import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL


type alias Model =
    TypeOptionList



-- UPDATE


type Msg
    = ToggleBtnMsg TypeOptionId Components.ToggleableBtn.Msg


update : Msg -> Model -> Model
update message typeOptionList =
    case message of
        ToggleBtnMsg id subMsg ->
            let
                updater target =
                    if target.id == id then
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
            List.map (\x -> (Html.map (ToggleBtnMsg x.id) (toggleableBtn x))) model
    in
        div
            [ class "btn-group" ]
            btnGroup
