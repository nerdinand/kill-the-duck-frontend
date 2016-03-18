module Status where

import Http
import Task exposing (andThen, Task)
import Json.Decode exposing (Decoder, (:=), object1, string)


fetch : Task Http.Error ()
fetch =
  Http.getString "status.json" `andThen` handleStatusResult


handleStatusResult : String -> Task x ()
handleStatusResult result =
  Signal.send status.address (decodeResult result)


status : Signal.Mailbox String
status =
  Signal.mailbox "Fetching..."


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

