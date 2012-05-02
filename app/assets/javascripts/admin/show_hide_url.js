function update_disabled(c){
    var a = ['.url_text_field','.taxon_select','.product_select','.blog_select'];
    for( i = 0; i < a.length; i++){
        $(a[i]).attr('disabled', true);
    }
    $(c).attr('disabled', false);
}

$(function(){
   $("#url_type_insert_new_url").click(function(){
       update_disabled('.url_text_field');
   });
    $("#url_type_select_from_taxon").click(function(){
        update_disabled('.taxon_select');
       });
    $("#url_type_select_from_product").click(function(){
        update_disabled('.product_select');
       });
    $("#url_type_select_from_blog").click(function(){
        update_disabled('.blog_select');
       });

    $('#edit_menu').submit(function(){
       if(!$('#url_type_insert_new_url').is(':checked')){
            $('#menu_url').val('');
           $('#menu_url').attr('disabled',false);
       }
    });
});