/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

  let args = [];
  let ready = false;

window.$l = function $l(arg){
  if (typeof arg === "function") {
    if (ready) {
      arg();
    } else {
      args.push(arg);
    }

  } else if (arg instanceof HTMLElement) {
    return new DOMNodeCollection([arg]);
  } else {
    let node = Array.from(document.querySelectorAll(arg));
    return new DOMNodeCollection(node);
  }

  document.addEventListener('DOMContentLoaded', () => {
    ready = true;
    args.forEach( (func) => {
      func();
    });
  });


};

window.$l.extend = function extend(base, ...objects){
  objects.forEach( (object) => {
    for (const key in object){
      base[key] = object[key];
    }
  });
  return base;
};

window.$l.ajax = function ajax(options){
  const request = new XMLHttpRequest();
  const defaults = {
  success: options["success"] || {},
  error: options["error"] || {},
  url: options["url"] || "",
  method: options["method"] || "GET",
  data: options["data"] || {},
  contentType: options["contentType"] || 'application/x-www-form-urlencoded; charset=UTF-8'
};

};


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(HTMLElements) {
    this.HTMLElements = HTMLElements;
  }
  html(string) {
    if (typeof string === undefined) {
      return this.HTMLElements[0].innerHTML;
    } else {
      for (let i = 0; i < this.HTMLElements.length; i++){
        this.HTMLElements[i].innerHTML = string;
      }
    }

  }
  empty() {
    this.HTMLElements.forEach( (el) => {
      el.innerHTML = "";
    });
  }
  append(element) {
    this.HTMLElements.forEach( (el) => {
      el.innerHTML = element.outerHTML;
    });
  }
  attr(attribute, value) {
    if (typeof value === 'undefined') {
      return this.HTMLElements[0].getAttribute(attribute);
    } else {
        this.HTMLElements.forEach((el) => {
        return el.setAttribute(attribute, value);
      });
    }
  }
  addClass(string) {
      return this.attr("class", string);
  }
  removeClass(string) {
      return this.attr("class", "");
  }
  children() {
    let childrenNodes = [];
    this.HTMLElements.forEach((el) => {
      childrenNodes = childrenNodes.concat(Array.from(el.children));
    });
    // console.log(childrenNodes);
    return new DOMNodeCollection(childrenNodes);
  }
  parent() {
    let parentNodes = [];
    this.HTMLElements.forEach((el) => {
      console.log(el.parentElement);
      parentNodes.push(el.parentElement);
    });
    // console.log(parentNodes);
    return new DOMNodeCollection(parentNodes);
  }

  find(selector) {
    let result = [];
    this.HTMLElements.forEach( (el) => {
      result = result.concat(el.querySelectorAll(selector));
    });
    return new DOMNodeCollection(result);
  }

  remove(){
    this.empty();
    this.HTMLElements = undefined;
  }

  on(action, cb){
    this.HTMLElements.forEach( (el) => {
      el.addEventListener(action, cb);
      el.cb = cb;
      console.log(el.cb);

    });
  }
  off(action) {
    this.HTMLElements.forEach( (el) => {
      console.log(el.cb);
      el.removeEventListener(action, el.cb);
    });
  }




}


module.exports = DOMNodeCollection;


/***/ })
/******/ ]);