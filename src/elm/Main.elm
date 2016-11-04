port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App
import Modal.Main exposing (..)
import Components.Layout exposing (layout)
import Components.Panel exposing (..)
import Components.CodeGenerator exposing (..)
import Components.GetTemplateCode exposing (getTemplateCode)


-- APP


main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( AppModel, Cmd Msg )
init =
    ( model, highLight (getTemplateCode model.options) )


model : AppModel
model =
    appModel



-- SUBSCRIPTIONS


port highLight : String -> Cmd msg


port hightLightedCode : (String -> msg) -> Sub msg


subscriptions : AppModel -> Sub Msg
subscriptions model =
    hightLightedCode HightLightedCode



-- UPDATE


type Msg
    = PanelMsg Components.Panel.Msg
    | CodeGeneratorMsg Components.CodeGenerator.Msg
    | HightLightedCode String


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    case msg of
        PanelMsg subMsg ->
            let
                options =
                    Components.Panel.update subMsg model.options

                code =
                    getTemplateCode options

                newModel =
                    { model | options = options }
            in
                ( newModel, highLight code )

        HightLightedCode lighLightedCode ->
            let
                newModel =
                    { model | code = lighLightedCode }
            in
                ( newModel, Cmd.none )

        CodeGeneratorMsg subMsg ->
            ( model, Cmd.none )



-- VIEW


view : AppModel -> Html Msg
view model =
    layout
        (div [ class "main-content" ]
            [ Html.App.map PanelMsg (Components.Panel.panel model.options)
            , Html.App.map CodeGeneratorMsg (Components.CodeGenerator.codeGenerator model.code)
            ]
        )
