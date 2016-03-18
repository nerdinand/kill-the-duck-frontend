module Update where

import Model exposing (..)

type Action = NowOkay | NowWarning | NowError

update : Action -> Model -> Model
update action model =
  case action of
    NowOkay ->
      Okay
    NowWarning ->
      Warning
    NowError ->
      Error
