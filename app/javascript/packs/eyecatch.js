$(document).on('DOMContentLoaded', function() {

  $('#article_eyecatchs').on('change',function(e){
    $('.image_area').empty();
    var files = e.target.files;
    var d = (new $.Deferred()).resolve();
    $.each(files,function(i,file){
      d = d.then(function(){return previewImage(file)});
    });
  })

  // var previewImageTest = function(){
    
    var previewImage = function(imageFile){
      var reader = new FileReader();
      var img = new Image();
      var def =$.Deferred();
      reader.onload = function(e){
        $('.image_area').append("<div class='image-box'></div>");
        $('.image-box').append(img);
        img.src = e.target.result;
        def.resolve(img);
      };
      reader.readAsDataURL(imageFile);
      return def.promise();
    }
})