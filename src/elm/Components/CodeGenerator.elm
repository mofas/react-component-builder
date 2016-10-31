module Components.CodeGenerator exposing (..)

-- import Debug exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Modal.Main exposing (AppModel)


importReactDeclaration : String
importReactDeclaration =
    """import React from 'react';"""


importPureRenderMixinDeclaration : String
importPureRenderMixinDeclaration =
    """
import PureRenderMixin from 'react-addons-pure-render-mixin';"""


objectComponentHeader : String
objectComponentHeader =
    """

const ComponentName = React.createClass({"""


objeComponentPureMixin : String
objeComponentPureMixin =
    """

mixins: [PureRenderMixin],"""


objeComponentctBody : String
objeComponentctBody =
    """

  defaultProps(){
    return {

    }
  }
"""


objectComponentFooter : String
objectComponentFooter =
    """
    render(){
      const {props} = this;

      return (
        <div></div>
      );
    }
});"""


classComponentHeader : String
classComponentHeader =
    """

class ComponentName extends React.Component {"""


pureClassComponentHeader : String
pureClassComponentHeader =
    """

class ComponentName extends React.PureComponent {"""


classComponentBody : String
classComponentBody =
    """
  constructor(props) {
    super(props);
  }

  static defaultProps = {

  }
"""


classComponentFooter : String
classComponentFooter =
    """
  render(){
    const {props} = this;

    return (
      <div></div>
    );
  }
}"""


exportDeclaration : String
exportDeclaration =
    """

export default ComponentName;"""



-- Update


type Msg
    = Noop



-- View


codeGenerator : AppModel -> Html Msg
codeGenerator model =
    let
        isObjectClass =
            model.componetType
                |> List.filter (\x -> x.id == "object")
                |> List.all (\x -> x.enabled == True)

        isPure =
            model.pure
                |> List.all (\x -> x.enabled == True)

        importDeclaration =
            if isPure && isObjectClass then
                importReactDeclaration ++ importPureRenderMixinDeclaration
            else
                importReactDeclaration

        snippetHeader =
            if isObjectClass then
                if isPure then
                    objectComponentHeader ++ objeComponentPureMixin
                else
                    objectComponentHeader
            else if isPure then
                pureClassComponentHeader
            else
                classComponentHeader

        snippetCode =
            if isObjectClass then
                importDeclaration
                    ++ snippetHeader
                    ++ objeComponentctBody
                    ++ objectComponentFooter
                    ++ exportDeclaration
            else
                importDeclaration
                    ++ snippetHeader
                    ++ classComponentBody
                    ++ classComponentFooter
                    ++ exportDeclaration
    in
        div
            [ class "code-generator-section" ]
            [ textarea
                [ class "code-snippet" ]
                [ text snippetCode ]
            ]
