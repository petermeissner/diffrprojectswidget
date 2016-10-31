// helper : change type printing
var atype = function(x){
  if( x == "change"){
    return "chg";
  }else if(x == "no-change"){
    return "==";
  }else if(x == "deletion"){
    return "del";
  }else if(x == "insertion"){
    return "ins";
  }
  return "";
};


// helper : correct item number
var item_number = function(array_or_string){
  if(       typeof(array_or_string) === "undefined" ){
    return 0;
  }else if( array_or_string === null ){
    return 0;
  } else if( typeof(array_or_string) === "string" ){
    return 1;
  }else{
    return Object.keys(array_or_string).length || 0 ;
  }
  return 0;
};


// helper : which element equals specific value
var which_equals = function(x, what){
  // special handling of string
  if( typeof(x)==="string" ){
    return x === what ? 0 : false;
  }
  // loop through and return first index hit
  for (var i = 0; i < x.length; i++) {
    if( x[i] === what ){
      return i;
    }
  }
  // return false if all fails
  return false;
};


// helper : extract 'column' from array of arrays
var get_column = function(a, c){
  var column = [];
  for (var i = 0; i < a.length; i++) {
    column.push(a[i][c]);
  }
  return column;
};


// Round Numbers
function round(x, digits){
  return parseFloat(x.toFixed(digits)) ;
}


// unique                         source: http://stackoverflow.com/a/11692295/1144966
Array.prototype.unique = function(a){
  return function(){ return this.filter(a) };
}(function(a,b,c){ return c.indexOf(a,b+1) < 0 });


// tabulate                       source: http://stackoverflow.com/a/5668246/1144966
function tabulate(arr) {
  var a = [], b = [], prev;
  arr.sort();
  for ( var i = 0; i < arr.length; i++ ) {
    if ( arr[i] !== prev ) {
      a.push(arr[i]);
      b.push(1);
    } else {
      b[b.length-1]++;
    }
    prev = arr[i];
  }
  return [a, b];
};


// max()                         source: http://stackoverflow.com/a/1669222/1144966
Array.prototype.max = function() {
  return Math.max.apply(null, this);
};


// min()                         source: http://stackoverflow.com/a/1669222/1144966
Array.prototype.min = function() {
  return Math.min.apply(null, this);
};


