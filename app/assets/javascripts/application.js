// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery.minicolors
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
    $(".colors").minicolors({
      position: 'top'
    });
  });

//tiles on select add/remove class
  function toggleClass(e){
    if ($(e).hasClass("selected")){
      $(e).removeClass("selected");
    }
    else{
      $(e).addClass("selected");
    }
  }

  //Update colors on selecting of Tiles
  function updateTileColors(){
    if ($(".selected").size() == 0){
      alert("Please select a square!")
    }
    else{
      selectedColor = $(".colors").val();
      selectedCells = []
      $(".selected").map(function() {
        $(this).css("background-color",selectedColor);
        selectedCells.push($( this ).attr("id"))
      });
      $.ajax({
        type: "POST",
        beforeSend: function(xhr) {
                      xhr.setRequestHeader('X-CSRF-Token', 
                      $('meta[name="csrf-token"]').attr('content'))
                    },
        url: "/grid_cells/update_cell",
        data: {cells: selectedCells.join(","),color_code: selectedColor}
      });
    }
  }

  //Reload Tiles
  function reloadCell(){
    if ($(".selected").size() == 0){
      $.ajax({
        type: "get",
        url: "/grid_cells/reload_cells"
      });
    }
  }

  //window.setInterval(reloadCell,8000);