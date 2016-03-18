module Status where

import Http
import Task exposing (andThen, Task)
import Json.Decode exposing (Decoder, (:=), object1, string)
import Update

fetch : Task Http.Error ()
fetch =
  Http.getString "status.json" `andThen` handleStatusResult


handleStatusResult : String -> Task x ()
handleStatusResult result =
  Signal.send status.address (toAction (decodeResult result))


status : Signal.Mailbox Update.Action
status =
  Signal.mailbox Update.NowWarning


toAction : String -> Update.Action
toAction actionString =
  case actionString of
    "okay" ->
      Update.NowOkay
    "warning" ->
      Update.NowWarning
    _ ->
      Update.NowError


decodeResult : String -> String
decodeResult result =
  Result.withDefault "Error" (Json.Decode.decodeString statusDecoder result)


statusDecoder : Decoder String
statusDecoder =
  object1 identity
    ("data" := statusDataDecoder)


statusDataDecoder : Decoder String
statusDataDecoder =
  "status" := string

