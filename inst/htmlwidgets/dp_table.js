HTMLWidgets.widget({

  name: "dp_table",
  type: "output",

  // initialization of drawing area
  initialize:
    function(el, width, height) {

    },

  // doing a resize
  resize:
    function(el, width, height) {

    },


  // doing duty to do
  renderValue:
    function(el, x) {

      // helper
      var table_row = function(i){
        var row_values =
        [
          "<pre>[" + x.alignment.alignment_i[i] + "]</pre>"  ,
          "<i>" + x.alignment.type[i] + "</i>" ,
          x.alignment.distance[i],
          "<i>" +
            x.text1.substring(
              x.alignment.from_1[i] === null ? null : (x.alignment.from_1[i] -1),
              x.alignment.to_1[i]   === null ? null : (x.alignment.to_1[i] + 1)
            ) +
          "</i>" ,
          x.alignment.token_i_1[i],
          x.alignment.token_i_2[i],
          "<i>" +
            x.text2.substring(
              x.alignment.from_2[i] === null ? null : (x.alignment.from_2[i] - 1) ,
              x.alignment.to_2[i]   === null ? null : (x.alignment.to_2[i] + 1)
            ) +
          "</i>",
        ];
        return "<tr class='" + x.alignment.type[i] + "' ><td>"+ row_values.join("</td><td>") + "</td></tr>" ;
      };

      // gen table
      $(el).append("<table>");
      var table = $(el).find("table");

      // fill table with values
      var table_head = [
          "#" ,
          "type",
          "distance",
          "token_1",
          "#1",
          "#2",
          "token_2"
      ];

      table.append("<thead><tr class='firstline'><th>"+ table_head.join("</th><th>") + "</th></tr></thead>");
      for (i = 0; i < x.alignment.alignment_i.length; i++) {
        table.append( table_row(i) );
      }

      // add
      $(document).ready(function() { table.stickyTableHeaders(); });
    }
});













