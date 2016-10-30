module Components.Panel exposing (..)

import Html.App
import Modal.Main exposing (Model, TypeOptionList, TypeOption)
import Components.ToggleableBtn exposing (Msg, toggleableBtn)
import Html exposing (..)
import Html.Attributes exposing (..)


--import String


type Msg
    = ToggleBtnMsg Components.ToggleableBtn.Msg


panel : Model -> Html Msg
panel model =
    let
        btnGroupGenerator =
            List.map (\x -> (Html.App.map ToggleBtnMsg (toggleableBtn x)))

        componetTypeBtnGroup =
            btnGroupGenerator model.componetType

        pureBtnGroup =
            btnGroupGenerator model.pure

        lifeCycleBtnGroup =
            btnGroupGenerator model.lifeCycle
    in
        div
            [ class "panel-section" ]
            [ div
                [ class "type-group" ]
                [ div
                    [ class "group-title" ]
                    [ text "Create component by"
                    ]
                , div
                    [ class "btn-group" ]
                    componetTypeBtnGroup
                ]
            , div
                [ class "type-group" ]
                [ div
                    [ class "group-title" ]
                    [ text "Is component pure?"
                    ]
                , div
                    [ class "btn-group" ]
                    pureBtnGroup
                ]
            , div
                [ class "type-group" ]
                [ div
                    [ class "group-title" ]
                    [ text "Life cycle"
                    ]
                , div
                    [ class "btn-group" ]
                    lifeCycleBtnGroup
                ]
            ]
