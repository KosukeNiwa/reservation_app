document.addEventListener('turbolinks:load', () => {
  $(".toggle-list").toggle();
  
  $(".login-icon-img").on("click", function () {
    $(".toggle-list").toggle();
  });

})