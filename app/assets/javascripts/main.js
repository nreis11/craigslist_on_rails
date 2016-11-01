$(document).on("turbolinks:load", function() {
  deleteButtonListener();
});

  var deleteButtonListener = function() {
    $(".delete-button").on("click", function(event) {
    event.preventDefault();
    console.log("CLICKED!");

    var clickButtonTarget = $(event.target);
    var action = clickButtonTarget.attr("href");

  var request = $.ajax({
    url: action,
    method: "delete",
    })

  request.done(function(response) {
    $(clickButtonTarget).parent().remove();
    console.log("REMOVED")
    });
  });
};

