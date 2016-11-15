
const Prism = require('prismjs');

require('prismjs/themes/prism-okaidia.css');
require('normalize.css');
require('./styles/main.css');

const Elm = require('../elm/Main');

const app = Elm.Main.embed(document.getElementById('app'));
const codeHightlight = (code) => {
    const hightLightCode = Prism.highlight(code, Prism.languages.javascript);
    app.ports.hightLightedCode.send(hightLightCode);
}

const copyCode = (id) => {
    const target = document.getElementById(id);
    console.log(target, id)
    target.select();
    try {
      document.execCommand('copy');
    } catch (err) {
      window.alert('Your browser do not support this function')
    }
}

app.ports.highLight.subscribe(codeHightlight);
app.ports.copyCode.subscribe(copyCode);
