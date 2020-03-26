$(function(){
  $('#recipe_image').change(function(){
      $('img').remove();
      var file = $(this).prop('files')[0];
      if(!file.type.match('image.*')){
          return;
      }
      var fileReader = new FileReader();
      fileReader.onloadend = function() {
        $('#result_recipelist_add').css('display','block');
          $('#result_recipelist_add').html('<img src="' + fileReader.result + '"/>');
      }
      fileReader.readAsDataURL(file);
  });
});

$(function(){
  // $('.image').change(function(){
  $(document).on('change','.image',function(){
      // $('.image').remove();
      var file = $(this).prop('files')[0];
      if(!file.type.match('image.*')){
          return;
      }
      var fileReader = new FileReader();
      fileReader.onloadend = function() {
        $('#result_recipelist_add').css('display','block');
          $('#result_recipelist_add').html('<img src="' + fileReader.result + '"/>');
      }
      fileReader.readAsDataURL(file);
  });
});

