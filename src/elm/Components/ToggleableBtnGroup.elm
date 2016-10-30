module Components.ToggleableBtnGroup exposing (..)

import Html.App
import Components.ToggleableBtn exposing (toggleableBtn)
import Modal.Main exposing (TypeOptionList)
import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL
-- UPDATE


type Msg
    = ToggleBtnMsg Components.ToggleableBtn.Msg


update : Msg -> TypeOptionList -> TypeOptionList
update message model =
    case message of
        ToggleBtnMsg subMsg ->
            model



-- View


toggleableBtnGroup : TypeOptionList -> Html Msg
toggleableBtnGroup model =
    let
        btnGroup =
            List.map (\x -> (Html.App.map ToggleBtnMsg (toggleableBtn x))) model
    in
        div
            [ class "btn-group" ]
            btnGroup
