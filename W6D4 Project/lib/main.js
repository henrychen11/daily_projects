const DOMNodeCollection = require("./dom_node_collection.js");

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
