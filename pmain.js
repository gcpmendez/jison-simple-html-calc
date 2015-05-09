$(document).ready(function () {
  $("button").click(function () {
    try {
      var result = postfix.parse($("input").val())
      $("span").html(result);
    } catch (e) {
      $("span").html(String(e));
    }
  });
});
