module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App
import Modal.Main exposing (Model, TypeOptionList, componetType, lifeCycle, pure, importLib)
import Components.Layout exposing (layout)
import Components.Panel exposing (..)
import Components.CodeGenerator exposing (codeGenerator)


-- APP


main : Program Never
main =
    Html.App.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL


model : Model
model =
    { componetType = componetType
    , pure = pure
    , lifeCycle = lifeCycle
    , importLib = importLib
    }



-- UPDATE


type Msg
    = NoOp
    | PanelMsg Components.Panel.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        PanelMsg ab ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    layout
        (div [ class "main-content" ]
            [ Html.App.map PanelMsg (Components.Panel.panel model)
            , codeGenerator model
            ]
        )
