!function(){function n(n){if("function"==typeof n){var i="loading"!==document.readyState;i?n():(g.push(n),p||(document.addEventListener("DOMContentLoaded",function(){for(;g.length;){var n=g.shift();n()}},!1),p=!0))}}function i(n){if(w){var i=window.top;i.postMessage(n,"*")}else v.push(n)}function t(){if(w)for(;v.length;){var n=v.shift();i(n)}}function e(n){var t=n.selector,e=n.action,o=n.params,a=n.callback;if(t&&e){var r="WeiboJSBridge"+s+t+s+e,c=null;if(a&&(c="xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,function(n){var i=16*window.Math.random()|0,t="x"===n?i:3&i|8;return t.toString(16)}),l[c]=a,r+=s+c),o){var f=null;try{f=window.JSON.stringify(o)}catch(d){}f&&f.length&&(r+=s+f)}i(r)}}function o(n){function i(n){var i=n.indexOf(s);return-1===i?null:n.substring(i+s.length)}if(n=i(n),n){var t=n.split(s)[0];if(t.length){var e=null;if(n=i(n),n)try{e=window.JSON.parse(n)}catch(o){}var a=x[t];"function"==typeof a&&a(e);var r=l[t];"function"==typeof r&&r(e),delete l[t]}}}function a(n,i,t){e({selector:"invoke",action:n,params:i,callback:function(n){var i=null,e=null;"function"==typeof t?e=t:t&&(i=n.success?t.success:t.fail,e=t.final);var o=n.code;"function"==typeof i&&i(n.params,o),"function"==typeof e&&e(n.params,!!n.success,o)}})}function r(n,i){e({selector:"on",action:n,callback:i})}function c(n,i){n&&"function"==typeof i&&(x[n]=i)}function f(){if(!w&&!window.WeiboJSBridge){w=!0,window.WeiboJSBridge=y,t();var n=document.createEvent("Events");n.initEvent("WeiboJSBridgeReady"),n.bridge=window.WeiboJSBridge,document.dispatchEvent(n)}}if(!window.WeiboJSBridge&&!window.__WeiboJSBridge){try{if(window.self===window.top)return}catch(d){}var u=location.protocol;if("http:"===u||"https:"===u){var s=":::",l={},x={},w=!1,v=[],g=[],p=!1,S={OK:200,MISSING_PARAMS:400,ILLEGAL_ACCESS:403,INTERNAL_ERROR:500,ACTION_NOT_FOUND:501,NO_RESULT:550,USER_CANCELLED:550,SERVICE_FORBIDDEN:553},y={invoke:a,on:r,STATUS_CODE:S};window.__WeiboJSBridge=y,c("_fontSettingsChanged_ios",function(i){function t(n){return n=parseInt(n,10),(window.isNaN(n)||0===n)&&(n=100),n=window.Math.max(20,n),n=window.Math.min(n,400),n}if(i){var e=t(i.percent);n(function(){document.getElementsByTagName("body")[0].style.webkitTextSizeAdjust=e+"%"})}});var h="WeiboJSBridge"+s+"communicationReady",E=h;window.addEventListener("message",function(n){var i=n.data;if("string"==typeof i&&0===i.indexOf("WeiboJSBridge"+s)){if(i===E)return f(),void 0;w&&o(i)}}),window.top.postMessage(h,"*")}}}();