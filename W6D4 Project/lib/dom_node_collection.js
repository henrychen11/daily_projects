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
