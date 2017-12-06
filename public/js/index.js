$(function(){
  $('#picker').spectrum({
    color: "#ffffff", 
    showPaletteOnly: true,
    preferredFormat: 'hex',
    palette: [ 
      ["#ffffff", "#cccccc", "#999999", "#666666", "#333333", "#000000"],
      ["#f44336", "#ff9800", "#ffeb3b", "#8bc34a", "#4caf50", "#03a9f4", "#2196f3"]
    ],

    change: function(color){
      console.log(color);
    }
  });
});