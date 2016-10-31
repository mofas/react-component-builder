module Components.Panel exposing (..)

import Html.App
import Modal.Main exposing (AppModel)
import Components.ToggleableBtnGroup exposing (toggleableBtnGroup)
import Components.RadioBtnGroup exposing (radioBtnGroup)
import Html exposing (..)
import Html.Attributes exposing (..)


--import String


type Msg
    = RadioComponentTypeBtnGroup Components.RadioBtnGroup.Msg
    | ToggleablePureBtnGroup Components.ToggleableBtnGroup.Msg
    | ToggleableLifeCycleBtnGroup Components.ToggleableBtnGroup.Msg



-- update


update : Msg -> AppModel -> AppModel
update msg model =
    case msg of
        RadioComponentTypeBtnGroup subMsg ->
            { model | componetType = Components.RadioBtnGroup.update subMsg model.componetType }

        ToggleablePureBtnGroup subMsg ->
            { model | pure = Components.ToggleableBtnGroup.update subMsg model.pure }

        ToggleableLifeCycleBtnGroup subMsg ->
            { model | lifeCycle = Components.ToggleableBtnGroup.update subMsg model.lifeCycle }



-- View


panel : AppModel -> Html Msg
panel model =
    div
        [ class "panel-section" ]
        [ div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "Create component by"
                ]
            , Html.App.map RadioComponentTypeBtnGroup (radioBtnGroup model.componetType)
            ]
        , div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "Is component pure?"
                ]
            , Html.App.map ToggleablePureBtnGroup (toggleableBtnGroup model.pure)
            ]
        , div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "Life cycle"
                ]
            , Html.App.map ToggleableLifeCycleBtnGroup (toggleableBtnGroup model.lifeCycle)
            ]
        ]
