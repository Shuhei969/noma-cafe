// $(window).on(`load`, (function() {
//   $(`.header-wrapper`).css(`display`, `block`);
// }));

// $(window).on(`load scroll`, (function() {
//   if ($(window).scrollTop() > 30) {
//     $('header').fadeIn(500),
//     $(`.header-wrapper`).css(`display`, `block`);
//   } else {
//     $('header').fadeOut(200);
//   }
// }));

import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

// import 'bootstrap';
// import '../stylesheets/application';

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


document.addEventListener('DOMContentLoaded', () => {
  const dataset = $(`#article-show`).data()
  const articleId = dataset.articleId
  axios.get(`/articles/${articleId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      if (hasLiked) {
        $('.active-heart').removeClass('hidden')
      } else {
        $('.inactive-heart').removeClass('hidden')
      }
    })
  $('.inactive-heart').on('click', () => {
    axios.post(`/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active-heart').removeClass('hidden')
          $('.inactive-heart').addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.active-heart').on('click', () => {
    axios.delete(`/articles/${articleId}/like`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active-heart').addClass('hidden')
          $('.inactive-heart').removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
})