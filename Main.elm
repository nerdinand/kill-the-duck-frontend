import Http
import Model exposing (initialModel)
import View exposing (view)
import Update exposing (update)
import Status exposing (fetch)
import Task exposing (Task)
import StartApp.Simple


main =
  StartApp.Simple.start
    { model = initialModel
    , update = update
    , view = view
    }

port fetchStatus : Task Http.Error ()
port fetchStatus =
  fetch
