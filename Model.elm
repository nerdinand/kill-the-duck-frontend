module Model where


type Model = Okay | Warning | Error | Inactive


initialModel : Model
initialModel =
  Inactive
