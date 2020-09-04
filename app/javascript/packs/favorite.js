document.addEventListener("DOMContentLoaded", function() {

  const postId = document.getElementById("list").getAttribute("data-id");
  const heart = document.getElementById("heart")
  const favoriteUserId = document.getElementById(`favorites_user_${postId}`)

  heart.addEventListener("click", function() {
    if (favoriteUserId.getAttribute("style") == "display:block;") {
      favoriteUserId.removeAttribute("style", "display:block;")
    } else {
      favoriteUserId.setAttribute("style", "display:block;")
    }
  });
  
});