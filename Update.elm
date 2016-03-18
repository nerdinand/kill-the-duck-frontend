module Update where

import Model exposing (..)
import Effects


type Action = NowOkay | NowWarning | NowError | NowInactive


update action model =
  let newModel =
    case action of
      NowOkay ->
        Okay
      NowWarning ->
        Warning
      NowError ->
        Error
      NowInactive ->
        Inactive
  in
    (newModel, Effects.none)
