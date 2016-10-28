
module Modal.Main exposing (..)

type alias TypeOptionList = List TypeOption

type alias TypeOption =
  { label: String
  , enabled: Bool
  }

componetType : TypeOptionList
componetType =
  [
    {
      label = "Object Component"
    , enabled = False
    }
  , {
      label = "Class Component"
    , enabled = False
    }
  ]


lifeCycle : TypeOptionList
lifeCycle =
  [
    {
      label = "defaultProps"
    , enabled = False
    }
  , {
      label = "componentWillMount"
    , enabled = False
    }
  , {
      label = "componentDidMount"
    , enabled = False
    }
  , {
      label = "componentWillReceiveProps"
    , enabled = False
    }
  , {
      label = "shouldComponentUpdate"
    , enabled = False
    }
  , {
      label = "componentWillUpdate"
    , enabled = False
    }
  , {
      label = "componentDidUpdate"
    , enabled = False
    }
  , {
      label = "componentWillUnmount"
    , enabled = False
    }
  ]

pure : TypeOptionList
pure =
  [
    {
      label = "Pure Rendering"
    , enabled = False
    }
  ]


importLib : TypeOptionList
importLib =
  [

  ]