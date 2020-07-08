$(document).on('DOMContentLoaded', function() {

  let prefectureVal = $('#q_prefecture_id_eq').val();
  if (prefectureVal !== "") {
    let selectedTemplate = $(`#area-of-prefecture${prefectureVal}`);
    $('#q_area_id_eq').remove();
    $('#q_prefecture_id_eq').after(selectedTemplate.html());
  };

  let defaultAreaSelect = `<select name="area" id="q_area_id_eq"><option value>---</option></select>`;

  $(document).on('change', '#q_prefecture_id_eq', function() {
   let prefectureVal = $('#q_prefecture_id_eq').val();
   if (prefectureVal !== "") {
    let selectedTemplate = $(`#area-of-prefecture${prefectureVal}`);
    $('#q_area_id_eq').remove();
    $('#q_prefecture_id_eq').after(selectedTemplate.html());
   } else {
    $('#q_area_id_eq').remove();
    $('#q_prefecture_id_eq').after(defaultAreaSelect);
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


