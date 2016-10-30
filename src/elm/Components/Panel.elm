module Components.Panel exposing (..)

import Html.App
import Modal.Main exposing (AppModel)
import Components.ToggleableBtnGroup exposing (toggleableBtnGroup)
import Html exposing (..)
import Html.Attributes exposing (..)


--import String


type Msg
    = ToggleableBtnGroup Components.ToggleableBtnGroup.Msg



-- update


update : Msg -> AppModel -> AppModel
update msg model =
    case msg of
        ToggleableBtnGroup subMsg ->
            model



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
            , Html.App.map ToggleableBtnGroup (toggleableBtnGroup model.componetType)
            ]
        , div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "Is component pure?"
                ]
            , Html.App.map ToggleableBtnGroup (toggleableBtnGroup model.pure)
            ]
        , div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "Life cycle"
                ]
            , Html.App.map ToggleableBtnGroup (toggleableBtnGroup model.lifeCycle)
            ]
        ]
