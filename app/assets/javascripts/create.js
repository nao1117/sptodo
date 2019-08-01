$(document).ready(function() {
  $(".best_in_place").best_in_place();
});

jQuery(function($) {
  var contents = $(".form");
  var button = contents.prev(".btn-flat-vertical-border");

  var slideToggle = function() {
    if (button.hasClass("open")) {
      button.text(button.data("close-label"));
      contents.slideDown();
    } else {
      button.text(button.data("open-label"));
      contents.slideUp();
    }
  };
  slideToggle();

  button.on("click", function() {
　　button.toggleClass("open")
    slideToggle();
  });
  
  
});

