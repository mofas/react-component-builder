port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Modal.Main exposing (..)
import Components.Layout exposing (layout)
import Components.Panel exposing (..)
import Components.CodeGenerator exposing (..)
import Components.GetTemplateCode exposing (getTemplateCode)


-- APP


main : Program Never AppModel Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( AppModel, Cmd Msg )
init =
    let
        code =
            (getTemplateCode model.options)

        initModel =
            { model | code = code }
    in
        ( initModel, highLight code )


model : AppModel
model =
    appModel



-- SUBSCRIPTIONS


port highLight : String -> Cmd msg


port copyCode : String -> Cmd msg


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
                    { model | options = options, code = code }
            in
                ( newModel, highLight code )

        HightLightedCode lighLightedCode ->
            let
                newModel =
                    { model | syntaxHighLightedCode = lighLightedCode }
            in
                ( newModel, Cmd.none )

        CodeGeneratorMsg subMsg ->
            case subMsg of
                CopyCode id ->
                    ( model, copyCode id )



-- VIEW


view : AppModel -> Html Msg
view model =
    layout
        (div [ class "main-content" ]
            [ Html.map PanelMsg (Components.Panel.panel model.options)
            , Html.map CodeGeneratorMsg (Components.CodeGenerator.codeGenerator model.code model.syntaxHighLightedCode)
            ]
        )
