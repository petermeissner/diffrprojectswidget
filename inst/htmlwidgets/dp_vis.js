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

    //// PREAPARATIONS /////

    // element size
    var total_width  = el.getBoundingClientRect().width;
    var total_height = el.getBoundingClientRect().height;

    // scale
    var width_scale   = d3.scale.linear().domain([0,30]).range([0, total_width]);
    var tmp_lines =
      Math.max(
        get_column( x.alignment, which_equals(x.alignment_vars, "token_i_1")).max(),
        get_column( x.alignment, which_equals(x.alignment_vars, "token_i_2" )).max()
      );
    var height_scale =
        d3.scale.linear()
          .domain([ 0, tmp_lines ])
          .range([5, Math.max( total_height, (2 * tmp_lines) )])
        ;


    // fitting x coordinates
    var xcompute = function(d, i){
        return width_scale(d[4] === 1 ? 0 : 20);
    };

    // fitting y coordinates
    var ycompute = function(d, i){
      return height_scale(d[0]);
    };

    // color scale
    var color_scale = d3.scale.category20();

    // tooltip - div
    var tooltip = d3.select("body")
      .append("div")
      .style("position", "absolute")
      .style("visibility", "hidden")
      .text("a simple tooltip")
      .classed("dp_vis_tooltip", true)
    ;




    // tooltip - function
    function tooltip_info(d, i){
      var info_text  = "" ;
      info_text += "token_i: "  + d[0] + ", ";
      info_text += "from: " + d[1] + ", ";
      info_text += "to: "   + d[2] + "\n\n";
      info_text += d[3];

      if( d[4] === 1 ){
        var text_data = x.text1_data;
      }else if( d[4] === 2 ){
        var text_data = x.text2_data;
      }else{
        var text_data = null;
      }

      for (var k = 0; k < item_number(x.text_data_vars); k++) {
        info_text += "\n" + x.text_data_vars[k] + ": " + text_data[i][k];
      }

      return info_text ;
    }

    function tooltip_info2(d, i){
      var info_text  = "" ;
      info_text += d[0] + " - ";
      info_text += d[3];
      info_text += " / "  + d[2] + " - ";
      info_text += d[1];
      return info_text ;
    }


    //// PLOTTING TEXT /////

    // select the svg element and remove existing children
    var svg = d3.select(el).select("svg");
    svg.selectAll("*").remove();

    d3.select(el).select("svg")
          .attr("height", Math.max(total_height, (2 * tmp_lines)) );

    svg
      .selectAll("rect")
      .data(x.text)
      .enter()
      .append("rect")
        .attr("x", xcompute)
        .attr("y", ycompute)
        .attr("width",  width_scale(10) )
        .attr("height", height_scale(0.8) )
        .style("fill",
          function(d, i){
            return color_scale(d[0]);
          }
        )
        .on("mouseover", function(d){
          tooltip
          .text(tooltip_info(d))
          .style("visibility", "visible")
          ;
        })
        .on("mousemove", function(d){
            return tooltip
            .style("top", (event.pageY-20)+"px")
            .style("left",(event.pageX+10)+"px")
            ;
        })
        .on("mouseout", function(){
          return tooltip.style("visibility", "hidden");
        })
    ;

    svg
      .append("text")
      .attr("x", width_scale(1))
      .attr("y", height_scale(0.3))
      .attr("font-size", "10px")
      .text("text 1")
    ;

    svg
      .append("text")
      .attr("x", width_scale(11))
      .attr("y", height_scale(0.3))
      .attr("font-size", "10px")
      .text("change")
    ;

    svg
      .append("text")
      .attr("x", width_scale(21))
      .attr("y", height_scale(0.3))
      .attr("font-size", "10px")
      .text("text 2")
    ;

    //// PLOTTING ALIGNMENT ////

    var paths =
      svg
        .selectAll("path")
        .data(x.alignment)
        .enter()
        .append("path")
      ;

    function getPath(x1, x2, y1, y2){
      var pattern = /_____/i ;
      var path = "";
      var xmid = (x1 + (x2-x1)*0.5) ;
      path += "M" +   x1 + " " + y1 + " ";
      path += "C" + xmid + " " + y1 + " " ;
      path +=       xmid + " " + y2 + ", " ;
      path +=         x2 + " " + y2 + " " ;
      return path ;
    }

    var pathAttr =
      paths
        .attr("save", 0)
        .attr("d" ,
          function(d, i) {
            var x1 = width_scale(10.2);
            var x2 = width_scale(19.8);
            var y1 = height_scale( (d[0]+0.5) );
            var y2 = height_scale( (d[1]+0.5) );
            if( d[3] === "insertion" ){
              x1 = width_scale(17);
              y1 = height_scale( (d[1]+0.5) );
            }
            if( d[3] === "deletion" ){
              x2 = width_scale(13);
              y2 = height_scale( (d[0]+0.5) );
            }
            return getPath(x1, x2, y1, y2) ;
          } )
        .style("stroke", function(d){
              if (d[3]=="change") {return "yellow" ;}
              if (d[3]=="no-change") {return "green" ;}
              if (d[3]=="deletion") {return "red" ;}
              if (d[3]=="insertion") {return "blue" ;}
            })
        .attr("trueColor", function(d){
          if (d[3]=="change") {return "yellow" ;}
          if (d[3]=="no-change") {return "green" ;}
          if (d[3]=="deletion") {return "red" ;}
          if (d[3]=="insertion") {return "blue" ;}
        })
        .style("stroke-width",
          height_scale(
             (Math.max(total_height, (2 * tmp_lines)) / tmp_lines) * 0.1
            ) - 5
        )
        .style("stroke-opacity", 0.5)
        .style("fill", "none")
        .on("mouseover", function(d, i){
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
           return (tooltip
          .text(tooltip_info2(d))
          .style("visibility", "visible"))
          ;
        })
        .on("mousemove", function(d){
            return tooltip
            .style("top", (event.pageY-20)+"px")
            .style("left",(event.pageX+10)+"px")
            ;
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
            d3.select(this).style("stroke","red").style("stroke-opacity",0.7).attr("save",1) ;
          }
        })
        ;

  }

});























