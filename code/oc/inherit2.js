var util = require("util");

function Parent(name) {
  this.name = name;
  this.age = 40;
}

Parent.prototype.toStr = function() {
  return "Parent:toStr name="+this.name+" age="+this.age;
}

Parent.prototype.callf = function() {
  console.log("Parent:callf");
  return this.f();
}

// �Ъ`�N�A��줣�|�z�L inherits �~�ӡA�u����Ƥ~�|�A�ҥH����٬O�n��ʳ]�w�A�Ϊ̥� call
function Child(name) { 
  Parent.call(this, name);
//  this.name = name;
//  this.age = 10;
}

util.inherits(Child, Parent);

Child.prototype.toStr = function() {
    console.log("Child=%s", Child);
    console.log("Child.super_=%s", Child.super_);
    console.log("Child.super_.prototype=%s", Child.super_.prototype);
    console.log("Child.super_.prototype.constructor=%s", Child.super_.prototype.constructor);
    console.log("this.__proto__.constructor=%s", this.__proto__.constructor);
    console.log("Child.super_.prototype.toStr()=%s", Child.super_.prototype.toStr());
    console.log("Parent.prototype.toStr.call(this)=%s", Parent.prototype.toStr.call(this));
//    console.log("this.super_.toStr()", this.super_.toStr()); // ����
    Parent.prototype.toStr.call(this);
    return "Child:toStr > "+Parent.prototype.toStr.call(this);
}

Child.prototype.f = function() {
   console.log("Child:f");
}

Child.prototype.print = function() {
  return console.log(this.toStr());
}

parent = new Parent("John");
console.log(parent.toStr());
// parent.print();
child = new Child("Johnson");
console.log(child.toStr());
child.print();
child.callf();
