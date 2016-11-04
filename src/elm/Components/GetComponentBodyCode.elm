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


propCodeGenerator : String -> Bool -> String
propCodeGenerator props isObjectClass =
    let
        code =
            "\n    " ++ props ++ """() {

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
                propCodeGenerator "componentWillMount" isObjectClass
            else
                ""

        componentDidMountCode =
            if lifeCycleMap.componentDidMount then
                propCodeGenerator "componentDidMount" isObjectClass
            else
                ""

        componentWillReceivePropsCode =
            if lifeCycleMap.componentWillReceiveProps then
                propCodeGenerator "componentWillReceiveProps" isObjectClass
            else
                ""

        shouldComponentUpdateCode =
            if lifeCycleMap.shouldComponentUpdate then
                propCodeGenerator "shouldComponentUpdate" isObjectClass
            else
                ""

        componentWillUpdateCode =
            if lifeCycleMap.componentWillUpdate then
                propCodeGenerator "componentWillUpdate" isObjectClass
            else
                ""

        componentDidUpdateCode =
            if lifeCycleMap.componentDidUpdate then
                propCodeGenerator "componentDidUpdate" isObjectClass
            else
                ""

        componentWillUnmountCode =
            if lifeCycleMap.componentWillUnmount then
                propCodeGenerator "componentWillUnmount" isObjectClass
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
