module Modal.Main exposing (..)


type alias AppModel =
    { componetType : TypeOptionList
    , lifeCycle : TypeOptionList
    , pure : TypeOptionList
    , importLib : TypeOptionList
    }


type alias TypeOptionList =
    List TypeOption


type alias TypeOption =
    { key : String
    , label : String
    , enabled : Bool
    }


componetType : TypeOptionList
componetType =
    [ { key = "Object"
      , label = "Object"
      , enabled = False
      }
    , { key = "Class"
      , label = "Class"
      , enabled = False
      }
    ]


pure : TypeOptionList
pure =
    [ { key = "Yes"
      , label = "Yes"
      , enabled = False
      }
    ]


lifeCycle : TypeOptionList
lifeCycle =
    [ { key = "defaultProps"
      , label = "defaultProps"
      , enabled = False
      }
    , { key = "componentWillMount"
      , label = "componentWillMount"
      , enabled = False
      }
    , { key = "componentDidMount"
      , label = "componentDidMount"
      , enabled = False
      }
    , { key = "componentWillReceiveProps"
      , label = "componentWillReceiveProps"
      , enabled = False
      }
    , { key = "shouldComponentUpdate"
      , label = "shouldComponentUpdate"
      , enabled = False
      }
    , { key = "componentWillUpdate"
      , label = "componentWillUpdate"
      , enabled = False
      }
    , { key = "componentDidUpdate"
      , label = "componentDidUpdate"
      , enabled = False
      }
    , { key = "componentWillUnmount"
      , label = "componentWillUnmount"
      , enabled = False
      }
    ]


importLib : TypeOptionList
importLib =
    []
