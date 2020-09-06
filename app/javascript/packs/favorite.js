function check() {
  const hearts = document.querySelectorAll(".heart-count"); 
  hearts.forEach(function(heart) {
    if (heart.getAttribute("data-load") != null) {
      return null;
    }
    heart.setAttribute("data-load", "true");

    heart.addEventListener("click", function() {
      const postId = this.getAttribute("data-id");
      const favoriteUser = document.getElementById(`favorites_user_${postId}`)
      console.log(favoriteUser);
      
      if (favoriteUser.getAttribute("style") == "display:block;") {
        favoriteUser.removeAttribute("style", "display:block;")
      } else {
        favoriteUser.setAttribute("style", "display:block;")
      }
    });
  });
}
setInterval(check, 1000);