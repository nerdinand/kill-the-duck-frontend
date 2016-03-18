import Http
import Html exposing (..)
import Html.Attributes exposing (..)
import Status exposing (status, fetch)
import Task exposing (Task)


main : Signal Html
main =
  Signal.map renderStatus status.signal


port fetchStatus : Task Http.Error ()
port fetchStatus =
  fetch


renderStatus statusSignal =
  div (statusStyle statusSignal) [ text statusSignal ]


statusStyle : String -> List Html.Attribute
statusStyle status =
  [
    style
      [ ("backgroundColor", statusColor status) ]
  ]


statusColor : String -> String
statusColor status =
  case status of
    "okay" ->
      "green"
    "warning" ->
      "yellow"
    _ ->
      "red"
