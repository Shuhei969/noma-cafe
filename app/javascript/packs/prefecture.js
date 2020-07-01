$(document).on('turbolinks:load', function() {

  let prefectureVal = $('#prefecture').val();
  if (prefectureVal !== "") {
    let selectedTemplate = $(`#city-of-prefecture${prefectureVal}`);
    $('#city').remove();
    $('#prefecture').after(selectedTemplate.html());
  };

  let defaultCitySelect = `<select name="city" id="city"><option value>---</option></select>`;

  $(document).on('change', '#prefecture', function() {
   let prefectureVal = $('#prefecture').val();
   if (prefectureVal !== "") {
    let selectedTemplate = $(`#city-of-prefecture${prefectureVal}`);
    $('#city').remove();
    $('#prefecture').after(selectedTemplate.html());
   } else {
    $('#city').remove();
    $('#prefecture').after(defaultCitySelect);
   };
 });
});