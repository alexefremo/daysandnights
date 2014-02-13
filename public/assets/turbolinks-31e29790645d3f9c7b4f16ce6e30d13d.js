(function(){var t,e,n,o,r,i,u,a,c,l,d,s,f,p,h,m,v,g,w,y,b,x,E,k,T,A,L,S,H,M,R,C,N,O,X,q,D,j,P,K,$,G,Q,Y,F,z,B,I,J,U,_,V,W,Z,te,ee={}.hasOwnProperty,ne=[].indexOf||function(t){for(var e=0,n=this.length;n>e;e++)if(e in this&&this[e]===t)return e;return-1},oe=[].slice;O={},l=10,h=null,M=null,E=["html"],K=null,f=null,Z=null,y=function(t){return F(),c(),V("page:fetch",{url:t}),null!=Z&&Z.abort(),Z=new XMLHttpRequest,Z.open("GET",B(t),!0),Z.setRequestHeader("Accept","text/html, application/xhtml+xml, application/xml"),Z.setRequestHeader("X-XHR-Referer",K),Z.onload=function(){var e;return V("page:receive"),(e=j())?($(t),d.apply(null,g(e)),G(),U(),V("page:load")):document.location.href=t},Z.onloadend=function(){return Z=null},Z.onabort=function(){return Y()},Z.onerror=function(){return document.location.href=t},Z.send()},w=function(t){return c(),null!=Z&&Z.abort(),d(t.title,t.body),P(t),V("page:restore")},c=function(){return O[h.position]={url:document.location.href,body:document.body,title:document.title,positionY:window.pageYOffset,positionX:window.pageXOffset},s(l)},q=function(t){return null==t&&(t=l),/^[\d]+$/.test(t)?l=parseInt(t):void 0},s=function(t){var e,n;for(e in O)ee.call(O,e)&&(n=O[e],e<=h.position-t&&(V("page:expire",O[e]),O[e]=null))},d=function(e,n,o,r){return document.title=e,document.documentElement.replaceChild(n,document.body),null!=o&&t.update(o),r&&m(),h=window.history.state,V("page:change"),V("page:update")},m=function(){var t,e,n,o,r,i,u,a,c,l,d,s;for(i=Array.prototype.slice.call(document.body.querySelectorAll('script:not([data-turbolinks-eval="false"])')),u=0,c=i.length;c>u;u++)if(r=i[u],""===(d=r.type)||"text/javascript"===d){for(e=document.createElement("script"),s=r.attributes,a=0,l=s.length;l>a;a++)t=s[a],e.setAttribute(t.name,t.value);e.appendChild(document.createTextNode(r.innerHTML)),o=r.parentNode,n=r.nextSibling,o.removeChild(r),o.insertBefore(e,n)}},I=function(t){return t.innerHTML=t.innerHTML.replace(/<noscript[\S\s]*?<\/noscript>/gi,""),t},$=function(t){return t!==K?window.history.pushState({turbolinks:!0,position:h.position+1},"",t):void 0},G=function(){var t,e;return(t=Z.getResponseHeader("X-XHR-Redirected-To"))?(e=z(t)===t?document.location.hash:"",window.history.replaceState(h,"",t+e)):void 0},F=function(){return K=document.location.href},Y=function(){return window.history.replaceState({turbolinks:!0,position:Date.now()},"",document.location.href)},Q=function(){return h=window.history.state},P=function(t){return window.scrollTo(t.positionX,t.positionY)},U=function(){return document.location.hash?document.location.href=document.location.href:window.scrollTo(0,0)},B=function(t){return z(t)},z=function(t){var e;return e=t,null==t.href&&(e=document.createElement("A"),e.href=t),e.href.replace(e.hash,"")},D=function(t){var e,n;return e=(null!=(n=document.cookie.match(new RegExp(t+"=(\\w+)")))?n[1].toUpperCase():void 0)||"",document.cookie=t+"=; expires=Thu, 01-Jan-70 00:00:01 GMT; path=/",e},V=function(t,e){var n;return n=document.createEvent("Events"),e&&(n.data=e),n.initEvent(t,!0,!0),document.dispatchEvent(n)},X=function(){return!V("page:before-change")},j=function(){var t,e,n,o,r,i;return e=function(){var t;return 400<=(t=Z.status)&&600>t},i=function(){return Z.getResponseHeader("Content-Type").match(/^(?:text\/html|application\/xhtml\+xml|application\/xml)(?:;|$)/)},o=function(t){var e,n,o,r,i;for(r=t.head.childNodes,i=[],n=0,o=r.length;o>n;n++)e=r[n],null!=("function"==typeof e.getAttribute?e.getAttribute("data-turbolinks-track"):void 0)&&i.push(e.getAttribute("src")||e.getAttribute("href"));return i},t=function(t){var e;return M||(M=o(document)),e=o(t),e.length!==M.length||r(e,M).length!==M.length},r=function(t,e){var n,o,r,i,u;for(t.length>e.length&&(i=[e,t],t=i[0],e=i[1]),u=[],o=0,r=t.length;r>o;o++)n=t[o],ne.call(e,n)>=0&&u.push(n);return u},!e()&&i()&&(n=f(Z.responseText),n&&!t(n))?n:void 0},g=function(e){var n;return n=e.querySelector("title"),[null!=n?n.textContent:void 0,I(e.body),t.get(e).token,"runScripts"]},t={get:function(t){var e;return null==t&&(t=document),{node:e=t.querySelector('meta[name="csrf-token"]'),token:null!=e?"function"==typeof e.getAttribute?e.getAttribute("content"):void 0:void 0}},update:function(t){var e;return e=this.get(),null!=e.token&&null!=t&&e.token!==t?e.node.setAttribute("content",t):void 0}},o=function(){var t,e,n,o,r,i;e=function(t){return(new DOMParser).parseFromString(t,"text/html")},t=function(t){var e;return e=document.implementation.createHTMLDocument(""),e.documentElement.innerHTML=t,e},n=function(t){var e;return e=document.implementation.createHTMLDocument(""),e.open("replace"),e.write(t),e.close(),e};try{if(window.DOMParser)return r=e("<html><body><p>test"),e}catch(u){return o=u,r=t("<html><body><p>test"),t}finally{if(1!==(null!=r?null!=(i=r.body)?i.childNodes.length:void 0:void 0))return n}},A=function(t){return t.defaultPrevented?void 0:(document.removeEventListener("click",b,!1),document.addEventListener("click",b,!1))},b=function(t){var e;return t.defaultPrevented||(e=v(t),"A"!==e.nodeName||k(t,e))?void 0:(X()||W(e.href),t.preventDefault())},v=function(t){var e;for(e=t.target;e.parentNode&&"A"!==e.nodeName;)e=e.parentNode;return e},p=function(t){return location.protocol!==t.protocol||location.host!==t.host},n=function(t){return(t.hash&&z(t))===z(location)||t.href===location.href+"#"},C=function(t){var e;return e=z(t),e.match(/\.[a-z]+(\?.*)?$/g)&&!e.match(new RegExp("\\.(?:"+E.join("|")+")?(\\?.*)?$","g"))},R=function(t){for(var e;!e&&t!==document;)e=null!=t.getAttribute("data-no-turbolink"),t=t.parentNode;return e},_=function(t){return 0!==t.target.length},N=function(t){return t.which>1||t.metaKey||t.ctrlKey||t.shiftKey||t.altKey},k=function(t,e){return p(e)||n(e)||C(e)||R(e)||_(e)||N(t)},e=function(){var t,e,n,o;for(e=1<=arguments.length?oe.call(arguments,0):[],n=0,o=e.length;o>n;n++)t=e[n],E.push(t);return E},L=function(){return document.addEventListener("DOMContentLoaded",function(){return V("page:change"),V("page:update")},!0)},H=function(){return"undefined"!=typeof jQuery?jQuery(document).on("ajaxSuccess",function(t,e){return jQuery.trim(e.responseText)?V("page:update"):void 0}):void 0},S=function(t){var e,n;return(null!=(n=t.state)?n.turbolinks:void 0)?(e=O[t.state.position])?w(e):W(t.target.location.href):void 0},T=function(){return Y(),Q(),f=o(),document.addEventListener("click",A,!0),window.addEventListener("popstate",S,!1)},x=void 0!==window.history.state||navigator.userAgent.match(/Firefox\/26/),u=window.history&&window.history.pushState&&window.history.replaceState&&x,r=!navigator.userAgent.match(/CriOS\//),J="GET"===(te=D("request_method"))||""===te,a=u&&r&&J,i=document.addEventListener&&document.createEvent,i&&(L(),H()),a?(W=y,T()):W=function(t){return document.location.href=t},this.Turbolinks={visit:W,pagesCached:q,allowLinkExtensions:e,supported:a}}).call(this);