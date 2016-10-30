module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App
import Modal.Main exposing (AppModel)
import Components.Layout exposing (layout)
import Components.Panel exposing (..)
import Components.CodeGenerator exposing (codeGenerator)


-- APP


main : Program Never
main =
    Html.App.beginnerProgram
        { model = appModel
        , view = view
        , update = update
        }



-- MODEL


appModel : AppModel
appModel =
    { componetType = Modal.Main.componetType
    , pure = Modal.Main.pure
    , lifeCycle = Modal.Main.lifeCycle
    , importLib = Modal.Main.importLib
    }



-- UPDATE


type Msg
    = PanelMsg Components.Panel.Msg


update : Msg -> AppModel -> AppModel
update msg model =
    case msg of
        PanelMsg subMsg ->
            model



-- VIEW


view : AppModel -> Html Msg
view model =
    layout
        (div [ class "main-content" ]
            [ Html.App.map PanelMsg (Components.Panel.panel model)
            , codeGenerator model
            ]
        )
