module Update where

import Model exposing (..)
import Effects


type Action = NowOkay | NowWarning | NowError


update action model =
  let model =
    case action of
      NowOkay ->
        Okay
      NowWarning ->
        Warning
      NowError ->
        Error
  in
    (model, Effects.none)
