// $(window).on(`load`, (function() {
//   $(`.header-padding`).css(`display`, 'none');
// }));

// $(window).on(`load scroll`, (function() {
//   if ($(window).scrollTop() > 30) {
//     $('header').fadeIn(500),
//     $(`.header-wrapper`).css(`display`, `block`);
//   } else {
//     $('header').fadeOut(200);
//   }
// }));

$(function(){
  
  // 「imageList」内の「img」をマウスオーバーした場合
  $('.card-eyecatch-list img').click(function(){
    $.subId = $(this).parent().attr('data-sub-image-id')
    $.mainImage = $("[data-image-id=" + $.subId + "]")
    $.mainImage.attr('src' , $(this).attr('src'));
  });
});