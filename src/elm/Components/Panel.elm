module Components.Panel exposing (..)
import Modal.Main exposing ( Model, TypeOptionList, TypeOption )

import Html exposing (..)
import Html.Attributes exposing (..)
--import String

panel : Model -> Html msg
panel model =
  let
    componetType = model.componetType
    pure = model.pure
    lifeCycle = model.lifeCycle
  in
    div
      [ class "panel-section" ]
      [
        div
          [ class "type-group" ]
          [
            div
              [ class "group-title" ]
              [
                text "Create component by"
              ]
          , div
              [ class "btn-group" ]
              ( List.map toggleableBtn componetType )
          ]
      , div
          [ class "type-group" ]
          [
            div
              [ class "group-title" ]
              [
                text "Is component pure?"
              ]
          , div
              [ class "btn-group" ]
              ( List.map toggleableBtn pure )
          ]
      , div
          [ class "type-group" ]
          [
            div
              [ class "group-title" ]
              [
                text "Life cycle"
              ]
          , div
              [ class "btn-group" ]
              ( List.map toggleableBtn lifeCycle )
          ]
      ]



toggleableBtn : TypeOption -> Html msg
toggleableBtn typeOption =
  let
    btnClass = if typeOption.enabled then "btn enabled" else "btn"
  in
    div
      [ class btnClass ]
      [
        text typeOption.label
      ]
