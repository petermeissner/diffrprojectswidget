HTMLWidgets.widget({

  name: "dp_vis",

  type: "output",

  // initialization of drawing area
  initialize: function(el, width, height) {

   var svg = d3.select(el).append("svg")
              .attr("width", width)
              .attr("height", height);

    return svg;
  },

  // doing a resize
  resize: function(el, width, height) {

     d3.select(el).select("svg")
      .attr("width", width)
      .attr("height", height);

  },


  // doing duty to do
  renderValue: function(el, x) {

    // data
    textbits      = HTMLWidgets.dataframeToD3(x.textbits);
    var alignment = HTMLWidgets.dataframeToD3(x.alignment);
    var text1     = x.text1;
    var text2     = x.text2;

    // functions
    var xcompute = function(d, i){
      return (d.textnr === 1 ? 1 : 21);
    };

    var ycompute = function(d, i){
      return (d.ti);
    };

    var color_scale = d3.scale.category20();

    // select the svg element and remove existing children
    var svg = d3.select(el).select("svg");
    svg.selectAll("*").remove();

    svg
      .selectAll("rect")
      .data(textbits)
      .enter()
      .append("rect")
        .attr("x", xcompute)
        .attr("y", ycompute)
        .attr("width", 10)
        .attr("height", 2)
        .style("fill", function(d, i){ return color_scale(i);})
      ;
  }

});























