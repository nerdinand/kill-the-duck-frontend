module Rendering where

import Model exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


render model =
  div (statusStyle model) [ text (toString model) ]


statusStyle : Model -> List Html.Attribute
statusStyle status =
  [
    style
      [ ("backgroundColor", statusColor status) ]
  ]


statusColor : Model -> String
statusColor status =
  case status of
    Okay ->
      "green"
    Warning ->
      "yellow"
    Error ->
      "red"
