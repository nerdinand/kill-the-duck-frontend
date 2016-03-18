module View where

import Html

import Rendering exposing (render)
import Update exposing (..)
import Model exposing (..)


view address model =
  Rendering.render model
