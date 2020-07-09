// $(window).on(`load`, (function() {
//   $(`.header-padding`).css(`display`, 'none');
// }));

$(window).on(`load scroll`, (function() {
  if ($(window).scrollTop() > 30) {
    $('header').fadeIn(500),
    $(`.header-wrapper`).css(`display`, `block`);
  } else {
    $('header').fadeOut(200);
  }
}));