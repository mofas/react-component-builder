module Components.RadioBtnGroup exposing (..)

import Components.RadioBtn exposing (radioBtn)
import Modal.Main exposing (TypeOptionId, TypeOptionList)
import Html exposing (..)
import Html.Attributes exposing (..)


-- MODEL


type alias Model =
    TypeOptionList



-- UPDATE


type Msg
    = ToggleBtnMsg TypeOptionId Components.RadioBtn.Msg


update : Msg -> Model -> Model
update message typeOptionList =
    case message of
        ToggleBtnMsg id subMsg ->
            let
                updater target =
                    if target.id == id then
                        Components.RadioBtn.update subMsg target
                    else
                        { target | enabled = False }
            in
                List.map updater
                    typeOptionList



-- View


radioBtnGroup : Model -> Html Msg
radioBtnGroup model =
    let
        btnGroup =
            List.map (\x -> (Html.map (ToggleBtnMsg x.id) (radioBtn x))) model
    in
        div
            [ class "btn-group" ]
            btnGroup
