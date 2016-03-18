module View where

import Html

import Rendering exposing (render)
import Update exposing (..)
import Model exposing (..)


view : Signal.Address Action -> Model -> Html.Html
view address model =
  Rendering.render model
