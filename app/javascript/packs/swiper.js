document.addEventListener("DOMContentLoaded", function(){
  var mySwiper = new Swiper('.swiper-container', {
    effect: 'fade',
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },

    pagination: {
      el: '.swiper-pagination',
      type: 'bullets',
      clickable: true
    },
  });
});