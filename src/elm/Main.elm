import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
--import Html.Events exposing ( onClick )

import Components.Hello exposing ( hello )

-- APP
main : Program Never
main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model = Int

model : number
model = 0


-- UPDATE
type Msg = NoOp | Increment

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
    Increment -> model + 1


-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
view : Model -> Html Msg
view model =
  div [ class "container"]
  [
    hello model
  ]


