
require('normalize.css');
require('./styles/main.css');

const Elm = require('../elm/Main');
Elm.Main.embed(document.getElementById('app'));

