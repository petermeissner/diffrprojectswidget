// some fundamentals -----
  // Round Numbers ------------------------
  function round(x, digits){
    return parseFloat(x.toFixed(digits)) ;
  }
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  // subset data --------------------------
  // version list
var version_list = texts.map(function(d){return d.version ; }) ;

// adjust lines . version
var min_version = texts.map(function(d){return d.version ; }).min() ;
for ( var i = 0; i < lines.length; i++ ) {
  lines[i].version = (lines[i].version - min_version) +1 ;
}

// use only those linkages that have also textlines to link to
var line_ids = lines.map(function(d){return d.tl_id;})
var linkage_filter = function(d){
  var pattern = /_____/i ;
  return  ( ( (line_ids.indexOf(d.ll_tl_id1) != -1) || pattern.test(d.ll_tl_id1) ) &&
              ( (line_ids.indexOf(d.ll_tl_id2) != -1) || pattern.test(d.ll_tl_id2) ) ) ;
}
var linkage = linkage.filter(linkage_filter)

// change order so that no-cahnge < change < deletion < insertion
function order_types(type){
  if(type=="change")     return -1;
  if(type=="no-change")  return -3;
  if(type=="deletion")   return 0;
  if(type=="insertion")  return 0;
  return 0 ;
}
var linkage = linkage.sort( function(a,b) {
  var ord = order_types(a.ll_type)-order_types(b.ll_type) ;
  if (ord ==0) return ord ;
  if (ord < 0) return -1 ;
  if (ord > 0) return 1   ;
} )

// order lines
// simple
for ( var i = 0; i < lines.length; i++ ) {
  lines[i].order = parseInt(lines[i].tl_lnr) ;
}


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





  // Map Code to Color --------------------
  /*function ccode_to_color(ccode) {
    var range = [111,112,113,114,121,122,123,124,125,131,132,133,134,141,142,143,144,145,21,22,23,241,242,243,244,25,26,27,28,29,31,32,33,34,411,412,421,422,43,441,442,45,51,52,53,54,55,56,611,612,613,6211,6212,6221,6222,631,632,633,634,6351,6352,636,637,638,639,641,642,643,651,652,653,66,67,68,71,72,73,8,9,10] ;
    if ( ccode == 999 ) {
      return "#C0C0C0" ;
    }
    return d3.scale.category20().domain(range)(ccode) ;
  }
*/



  function ccode_to_color(ccode) {
    var ccode = parseInt(ccode) ;
    if ( ccode == 999 ) {
      return "#C0C0C0" ;
    }
    if ( [111,112,113,114,121,122,123,124,125,131,132,133,134,141,142,143,144,145].indexOf(ccode)!=-1){
      return "#ec7014" ;
    }
    if ( [21,22,23,241,242,243,244,25,26,27,28,29].indexOf(ccode)!=-1){
      return "#fcbba1" ;
    }
    if ( [31,32,33,34].indexOf(ccode)!=-1){
      return "#D94801" ;
    }
    if ( [411,412,421,422,43,441,442,45].indexOf(ccode)!=-1){
      return "#41ab5d" ;
    }
    if ( [51,52,53,54,55,56].indexOf(ccode)!=-1){
      return "#e7298a" ;
    }
    if ( [611,612,613,6211,6212,6221,6222,631,632,633,634,6351,6352,636,637,638,639,641,642,643,651,652,653,66,67,68].indexOf(ccode)!=-1){
      return "#fed976" ;
    }
    if ( [71,72,73].indexOf(ccode)!=-1){
      return "#ece7f2" ;
    }
    if ( [8].indexOf(ccode)!=-1){
      return "#a6bddb" ;
    }
    if ( [9].indexOf(ccode)!=-1){
      return "#3690c0" ;
    }
    if ( [10].indexOf(ccode)!=-1){
      return "#045a8d" ;
    }
    return "	#FFFFFF" ;
  }

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  // Version Info ------------------------------
  texts.map(function(d){return d.t_id;} ) ;
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



  // max_lines ---------------------------------
  var max_lines = tabulate(lines.map(function(d){return d.t_id ;}))[1].max() ;
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  // Zoom ---------------------------------
  var svgContainer = d3.select("body").append("svg")
.attr("width",  texts.length*160)
.attr("height", max_lines + 30  )
.style("border", "1px solid silver")
.append("g")
//.call(d3.behavior.zoom().scaleExtent([1, 10]).on("zoom", zoom))
;

function zoom() {
  svgContainer.attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")");
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  // version labels ------------------------------
  function onlyUnique(value, index, self) {
    return self.indexOf(value) === index;
  }
var versions = svgContainer.selectAll("text")
.data(texts.map(function(d){return d.t_id;} ).sort())
.enter()
.append("text") ;

versionAttr =  versions
.attr("x", function(d, i){return  i*160+10 ;})
.attr("y", "15")
.style("stroke", "black")
.style("stroke-size", "1")
.style("font-size", "6")
.text(function(d){return d; })
;
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  // Plotting Nodes ------------------------
  var nodes = svgContainer.selectAll("g")
.data(lines)
.enter()
.append("g");

function node_y_pos(lines){
  return (lines.order)*1+20 ;
};
function node_x_pos(lines) {
  return ((lines.version-1)*160)+10;
};

nodes.append("rect")
.attr("id", function(d)  {return d.tl_id ; })
.attr("x", function (d){ return node_x_pos(d); } )
.attr("y", function (d){ return node_y_pos(d); } )
.attr("width", "60")
.attr("height", "1")
.style("fill", function(d)  {return ccode_to_color(d.tl_corpus_code) ; }   )
.on("mouseover", function(d){
  tooltip
  .text(tooltip_info(d))
  .style("visibility", "visible")
  .style("fill", "white")
  ;
})
.on("mousemove", function(){
  return tooltip
  .style("top", (event.pageY-10)+"px")
  .style("left",(event.pageX+10)+"px")
  ;
})
.on("mouseout", function(){
  return tooltip.style("visibility", "hidden");
})


// Tooltip ------------------------------
  var tooltip = d3.select("body")
.append("div")
.style("position", "absolute")
.style("z-index", "10")
.style("visibility", "hidden")
.style("background-color", "silver")
.style("padding", "1px 5px")
.style("border", "1px solid black")
.style("white-space", "pre-line")
.style("font-size", "0.2em")
.text("a simple tooltip")
;
function tooltip_info(d){
  var info_text  = "" ;
  info_text += "lnr: " + d.tl_lnr + "\n";
  info_text += "code:" + d.tl_corpus_code + "\n";
  info_text += d.tl_text + "\n";
  return info_text ;
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



  // Plotting Links ------------------------------
  var paths = svgContainer.selectAll("path")
.data(linkage)
.enter()
.append("path")
;

getX = function(nodeID, r){
  var x = document.getElementById(nodeID).getBBox().x ;
  var w = document.getElementById(nodeID).getBBox().width ;
  if ( r==0 ) {
    x = x - 5 ;
  }else{
    x = x + 5 ;
  }
  return x + w*r ;
};

getY = function(nodeID){
  var y = document.getElementById(nodeID).getBBox().y ;
  var h = document.getElementById(nodeID).getBBox().height ;
  return  y - h + h*0.5 ;
};


// thanks to: http://blogs.sitepointstatic.com/examples/tech/svg-curves/cubic-curve.html for inspiration
function getPath(id1, id2){
  var pattern = /_____/i ;
  var path = "";

  if( pattern.test(id1) ){
    var x1 = getX(id2, 0)-20;
    var y1 = getY(id2);
  }else{
    var x1 = getX(id1, 1);
    var y1 = getY(id1);
  }
  if( pattern.test(id2) ){
    var x2 = getX(id1, 1)+20;
    var y2 = getY(id1);
  }else{
    var x2 = getX(id2, 0);
    var y2 = getY(id2);
  }
  var xmid = (x1 + (x2-x1)*0.5) ;
  path += "M" +   x1 + " " + y1 + " ";
  path += "C" + xmid + " " + y1 + " " ;
  path +=       xmid + " " + y2 + ", " ;
  path +=         x2 + " " + y2 + " " ;
  return path ;
} ;


var pathAttr = paths
.attr("save",0)
.attr("d" ,
      function(d) {
        return getPath(d.ll_tl_id1, d.ll_tl_id2) ;
      } )
.style("stroke", function(d){
  if (d.ll_type=="change") {return "yellow" ;}
  if (d.ll_type=="no-change") {return "green" ;}
  if (d.ll_type=="deletion") {return "red" ;}
  if (d.ll_type=="insertion") {return "blue" ;}
})
.attr("trueColor", function(d){
  if (d.ll_type=="change") {return "yellow" ;}
  if (d.ll_type=="no-change") {return "green" ;}
  if (d.ll_type=="deletion") {return "red" ;}
  if (d.ll_type=="insertion") {return "blue" ;}
})
.style("stroke-width", "1")
.style("stroke-opacity", 0.5)
.style("fill", "none")
.on("mouseover", function(){
  if ( d3.select(this).attr("save")==0 ) {
    d3.select(this)
    .style("stroke","red")
    .style("stroke-opacity",0.7) ;
  }else{
    d3.select(this)
    .style("stroke","red")
    .style("stroke-opacity",0.7)
    .attr("save", 1) ;
  }
})
.on("mouseout", function(){
  if ( d3.select(this).attr("save")==0 ) {
    d3.select(this)
    .style("stroke", function(){ return d3.select(this).attr("trueColor"); })
    .style("stroke-opacity", 0.5) ;
  }else{
    d3.select(this)
    .style("stroke","red").style("stroke-opacity",0.3).attr("save", 1) ;
  }
})
.on("click", function(){
  if ( d3.select(this).attr("save")==1 ) {
    d3.select(this).attr("save",0).style("stroke","black").style("stroke-opacity",0.3) ;
  }else{
    d3.select(this).style("stroke","red").style("stroke-opacity",0.7).attr("save", 1) ;
  }
})
;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
