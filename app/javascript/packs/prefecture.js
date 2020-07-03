$(document).on('DOMContentLoaded', function() {

  let prefectureVal = $('#article_prefecture_id').val();
  if (prefectureVal !== "") {
    let selectedTemplate = $(`#city-of-prefecture${prefectureVal}`);
    $('#article_city_id').remove();
    $('#article_prefecture_id').after(selectedTemplate.html());
  };

  let defaultCitySelect = `<select name="city" id="article_city_id"><option value>---</option></select>`;

  $(document).on('change', '#article_prefecture_id', function() {
   let prefectureVal = $('#article_prefecture_id').val();
   if (prefectureVal !== "") {
    let selectedTemplate = $(`#city-of-prefecture${prefectureVal}`);
    $('#article_city_id').remove();
    $('#article_prefecture_id').after(selectedTemplate.html());
   } else {
    $('#article_city_id').remove();
    $('#article_prefecture_id').after(defaultCitySelect);
   };
 });
});


// $(document).on('turbolinks:load', function() {

//   let prefectureVal = $('#prefecture').val();
//   if (prefectureVal !== "") {
//     let selectedTemplate = $(`#city-of-prefecture${prefectureVal}`);
//     $('#city').remove();
//     $('#prefecture').after(selectedTemplate.html());
//   };

//   let defaultCitySelect = `<select name="city" id="city"><option value>---</option></select>`;

//   $(document).on('change', '#prefecture', function() {
//    let prefectureVal = $('#prefecture').val();
//    if (prefectureVal !== "") {
//     let selectedTemplate = $(`#city-of-prefecture${prefectureVal}`);
//     $('#city').remove();
//     $('#prefecture').after(selectedTemplate.html());
//    } else {
//     $('#city').remove();
//     $('#prefecture').after(defaultCitySelect);
//    };
//  });
// });