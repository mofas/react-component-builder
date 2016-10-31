module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App
import Modal.Main exposing (..)
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
    { componetType = componetType
    , pure = pure
    , lifeCycle = lifeCycle
    , importCSS = importCSS
    , importLibImmutableJS = importLibImmutableJS
    , importLibReactRouter = importLibReactRouter
    , importLibRedux = importLibRedux
    }



-- UPDATE


type Msg
    = PanelMsg Components.Panel.Msg


update : Msg -> AppModel -> AppModel
update msg model =
    case msg of
        PanelMsg subMsg ->
            Components.Panel.update subMsg model



-- VIEW


view : AppModel -> Html Msg
view model =
    layout
        (div [ class "main-content" ]
            [ Html.App.map PanelMsg (Components.Panel.panel model)
            , codeGenerator model
            ]
        )
