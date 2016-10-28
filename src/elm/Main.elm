import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
--import Html.Events exposing ( onClick )

import Modal.Main exposing ( Model, TypeOptionList, componetType, lifeCycle, pure, importLib)
import Components.Layout exposing ( layout )
import Components.Panel exposing ( panel )
import Components.CodeGenerator exposing ( codeGenerator )

-- APP
main : Program Never
main =
  Html.beginnerProgram
  {
    model = model
  , view = view
  , update = update
  }

-- MODEL

model : Model
model =
  {
    componetType = componetType
  , pure = pure
  , lifeCycle = lifeCycle
  , importLib = importLib
  }


-- UPDATE
type Msg = NoOp | DoNothing

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
    DoNothing -> model



-- VIEW
view : Model -> Html Msg
view model =
  layout (
    div [ class "main-content"]
    [
      panel model
    , codeGenerator model
    ]
  )

