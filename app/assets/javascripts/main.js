$(document).on("turbolinks:load", function() {
  deleteButtonListener();
  newArticleLinkListener();
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

  var newArticleLinkListener = function() {
  $("#new-article-link").on("ajax:success", function(e, data, status, xhr){
      $("#new-article-container").html(data);
    })

    .on("ajax:error", function(e, data, status, error){
      console.error(error)
    });
}




