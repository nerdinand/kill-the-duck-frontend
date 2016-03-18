module View (view) where

import Html exposing (..)
import Html.Attributes exposing (..)

import Update exposing (..)
import Model exposing (..)


view model =
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
