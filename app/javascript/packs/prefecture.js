$(document).on('DOMContentLoaded', function() {

  let prefectureVal = $('#article_prefecture_id').val();
  if (prefectureVal !== "") {
    let selectedTemplate = $(`#area-of-prefecture${prefectureVal}`);
    $('#article_area_id').remove();
    $('#article_prefecture_id').after(selectedTemplate.html());
  };

  let defaultAreaSelect = `<select name="area" id="article_area_id"><option value>---</option></select>`;

  $(document).on('change', '#article_prefecture_id', function() {
   let prefectureVal = $('#article_prefecture_id').val();
   if (prefectureVal !== "") {
    let selectedTemplate = $(`#area-of-prefecture${prefectureVal}`);
    $('#article_area_id').remove();
    $('#article_prefecture_id').after(selectedTemplate.html());
   } else {
    $('#article_area_id').remove();
    $('#article_prefecture_id').after(defaultAreaSelect);
   };
 });
});

// $(document).on('DOMContentLoaded', function() {

//   let prefectureVal = $('#article_prefecture_id').val();
//   if (prefectureVal !== "") {
//     let selectedTemplate = $(`#city-of-prefecture${prefectureVal}`);
//     $('#article_city_id').remove();
//     $('#article_prefecture_id').after(selectedTemplate.html());
//   };

//   let defaultCitySelect = `<select name="city" id="article_city_id"><option value>---</option></select>`;

//   $(document).on('change', '#article_prefecture_id', function() {
//    let prefectureVal = $('#article_prefecture_id').val();
//    if (prefectureVal !== "") {
//     let selectedTemplate = $(`#city-of-prefecture${prefectureVal}`);
//     $('#article_city_id').remove();
//     $('#article_prefecture_id').after(selectedTemplate.html());
//    } else {
//     $('#article_city_id').remove();
//     $('#article_prefecture_id').after(defaultCitySelect);
//    };
//  });
// });


