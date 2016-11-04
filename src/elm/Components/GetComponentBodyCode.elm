module Components.GetComponentBodyCode exposing (..)

import Modal.Main exposing (TypeOptionList)


objeComponentctBody : String
objeComponentctBody =
    """

"""


classComponentBody : String
classComponentBody =
    """

    constructor(props) {
      super(props);
    }

"""


type alias LifeCycleMap =
    { defaultProps : Bool
    , componentWillMount : Bool
    , componentDidMount : Bool
    , componentWillReceiveProps : Bool
    , shouldComponentUpdate : Bool
    , componentWillUpdate : Bool
    , componentDidUpdate : Bool
    , componentWillUnmount : Bool
    }


isKeyEnabledInOptionList : TypeOptionList -> String -> Bool
isKeyEnabledInOptionList typeOptionList id =
    typeOptionList
        |> List.filter (\x -> x.id == id)
        |> List.all (\x -> x.enabled == True)


getLifeCycleMap : TypeOptionList -> LifeCycleMap
getLifeCycleMap lifecycleList =
    let
        isKeyEnabled =
            isKeyEnabledInOptionList lifecycleList
    in
        { defaultProps = (isKeyEnabled "defaultProps")
        , componentWillMount = (isKeyEnabled "componentWillMount")
        , componentDidMount = (isKeyEnabled "componentDidMount")
        , componentWillReceiveProps = (isKeyEnabled "componentWillReceiveProps")
        , shouldComponentUpdate = (isKeyEnabled "shouldComponentUpdate")
        , componentWillUpdate = (isKeyEnabled "componentWillUpdate")
        , componentDidUpdate = (isKeyEnabled "componentDidUpdate")
        , componentWillUnmount = (isKeyEnabled "componentWillUnmount")
        }


getDefaultPropCode : Bool -> String
getDefaultPropCode isObjectClass =
    if isObjectClass then
        """
    defaultProps(){
      return {

      }
    },
"""
    else
        """
    static defaultProps = {

    }
"""


getComponentWillMountCodeCode : Bool -> String
getComponentWillMountCodeCode isObjectClass =
    let
        code =
            """
    componentWillMount() {

    }"""
    in
        if isObjectClass then
            code ++ ",\n"
        else
            code ++ "\n"


getComponentBody : Bool -> TypeOptionList -> String
getComponentBody isObjectClass lifeCycleTypeOptionList =
    let
        lifeCycleMap =
            getLifeCycleMap lifeCycleTypeOptionList

        code =
            if isObjectClass then
                objeComponentctBody
            else
                classComponentBody

        defaultPropsCode =
            if lifeCycleMap.defaultProps then
                getDefaultPropCode isObjectClass
            else
                ""

        componentWillMountCode =
            if lifeCycleMap.componentWillMount then
                getComponentWillMountCodeCode isObjectClass
            else
                ""

        componentDidMountCode =
            if lifeCycleMap.componentDidMount then
                ""
            else
                ""

        componentWillReceivePropsCode =
            if lifeCycleMap.componentWillReceiveProps then
                ""
            else
                ""

        shouldComponentUpdateCode =
            if lifeCycleMap.shouldComponentUpdate then
                ""
            else
                ""

        componentWillUpdateCode =
            if lifeCycleMap.componentWillUpdate then
                ""
            else
                ""

        componentDidUpdateCode =
            if lifeCycleMap.componentDidUpdate then
                ""
            else
                ""

        componentWillUnmountCode =
            if lifeCycleMap.componentWillUnmount then
                ""
            else
                ""
    in
        code
            ++ defaultPropsCode
            ++ componentWillMountCode
            ++ componentDidMountCode
            ++ componentWillReceivePropsCode
            ++ shouldComponentUpdateCode
            ++ componentWillUpdateCode
            ++ componentDidUpdateCode
            ++ componentWillUnmountCode
