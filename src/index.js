import './main.scss';
import {Main} from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

var tokenName = 'token';
var token = localStorage.getItem(tokenName) || null;
var app = Main.embed(document.getElementById('root'), {token: token});
app.ports.setToken.subscribe(function(token) {
  localStorage.setItem(tokenName, token);
});

registerServiceWorker();
