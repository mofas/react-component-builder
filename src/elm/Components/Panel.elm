module Components.Panel exposing (..)

import Modal.Main exposing (OptionModel)
import Components.ToggleableBtnGroup exposing (toggleableBtnGroup)
import Components.RadioBtnGroup exposing (radioBtnGroup)
import Html exposing (..)
import Html.Attributes exposing (..)


--import String


type Msg
    = RadioComponentTypeBtnGroup Components.RadioBtnGroup.Msg
    | ToggleablePureBtnGroup Components.ToggleableBtnGroup.Msg
    | ToggleableLifeCycleBtnGroup Components.ToggleableBtnGroup.Msg
    | ToggleableImportCSSBtnGroup Components.ToggleableBtnGroup.Msg
    | ToggleableImportImmutableBtnGroup Components.ToggleableBtnGroup.Msg
    | ToggleableImportReactRouterBtnGroup Components.ToggleableBtnGroup.Msg
    | ToggleableImportReduxBtnGroup Components.ToggleableBtnGroup.Msg



-- update


update : Msg -> OptionModel -> OptionModel
update msg model =
    case msg of
        RadioComponentTypeBtnGroup subMsg ->
            { model | componetType = Components.RadioBtnGroup.update subMsg model.componetType }

        ToggleablePureBtnGroup subMsg ->
            { model | pure = Components.ToggleableBtnGroup.update subMsg model.pure }

        ToggleableLifeCycleBtnGroup subMsg ->
            { model | lifeCycle = Components.ToggleableBtnGroup.update subMsg model.lifeCycle }

        ToggleableImportCSSBtnGroup subMsg ->
            { model | importCSS = Components.ToggleableBtnGroup.update subMsg model.importCSS }

        ToggleableImportImmutableBtnGroup subMsg ->
            { model | importLibImmutableJS = Components.ToggleableBtnGroup.update subMsg model.importLibImmutableJS }

        ToggleableImportReactRouterBtnGroup subMsg ->
            { model | importLibReactRouter = Components.ToggleableBtnGroup.update subMsg model.importLibReactRouter }

        ToggleableImportReduxBtnGroup subMsg ->
            { model | importLibRedux = Components.ToggleableBtnGroup.update subMsg model.importLibRedux }



-- View


panel : OptionModel -> Html Msg
panel model =
    div
        [ class "panel-section" ]
        [ div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "Create component by"
                ]
            , Html.map RadioComponentTypeBtnGroup (radioBtnGroup model.componetType)
            ]
        , div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "Is component pure?"
                ]
            , Html.map ToggleablePureBtnGroup (toggleableBtnGroup model.pure)
            ]
        , div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "Life cycle"
                ]
            , Html.map ToggleableLifeCycleBtnGroup (toggleableBtnGroup model.lifeCycle)
            ]
        , div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "Import CSS"
                ]
            , Html.map ToggleableImportCSSBtnGroup (toggleableBtnGroup model.importCSS)
            ]
        , div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "Immutable JS"
                ]
            , Html.map ToggleableImportImmutableBtnGroup (toggleableBtnGroup model.importLibImmutableJS)
            ]
        , div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "React Router"
                ]
            , Html.map ToggleableImportReactRouterBtnGroup (toggleableBtnGroup model.importLibReactRouter)
            ]
        , div
            [ class "type-group" ]
            [ div
                [ class "group-title" ]
                [ text "Redux"
                ]
            , Html.map ToggleableImportReduxBtnGroup (toggleableBtnGroup model.importLibRedux)
            ]
        ]
