import Http
import Html
import Model exposing (initialModel)
import View exposing (view)
import Update exposing (update)
import Status exposing (status, handleStatusResult)
import Task exposing (Task)
import StartApp
import Effects
import Time exposing (second, Time)


main : Signal Html.Html
main =
  Signal.map view model


model : Signal Model.Model
model =
  Signal.foldp update initialModel status.signal


clock : Signal Time
clock =
  Time.every second


periodicUpdate : Signal (Task Http.Error ())
periodicUpdate =
  Signal.map (\_ -> Status.fetch) clock


port runner : Signal (Task Http.Error ())
port runner =
  periodicUpdate
