if (document.URL.match(/new/) || document.URL.match(/edit/)) {
  document.addEventListener("DOMContentLoaded", function(){
    const imageList = document.getElementById("image-list");

    
    const createImageHTML = function(blob) {
      
      const imageElement = document.createElement("div");
      imageElement.setAttribute("id", "image_element");
      let imageElementNum = document.querySelectorAll("#image_element").length;
      
      const blobImage = document.createElement("img");
      blobImage.setAttribute("src", blob);
      
      const inputHTML = document.createElement("input");
      inputHTML.setAttribute("id", `post_image_${imageElementNum}`);
      inputHTML.setAttribute("name", "post[images][]");
      inputHTML.setAttribute("type", "file");
      
      
      imageElement.appendChild(blobImage);
      imageElement.appendChild(inputHTML);
      imageList.appendChild(imageElement);
      
      inputHTML.addEventListener("change", function(e){
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);
        
        createImageHTML(blob);
      });
    }

    document.getElementById("post_images").addEventListener("change", function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}