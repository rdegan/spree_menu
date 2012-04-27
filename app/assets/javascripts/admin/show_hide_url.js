function setId(c,id){
    var a = ['.url_text_field','.taxon_select','.product_select','.blog_select'];
    for( i = 0; i < a.length; i++){
        $(a[i]).attr('id','');
    }
    $(c).attr('id',id);
}
     var ID = 'menu_url';
$(function(){
   $("#url_type_insert_new_url").click(function(){
        setId('.url_text_field',ID);
   });
    $("#url_type_select_from_taxon").click(function(){
            setId('.taxon_select',ID);
       });
    $("#url_type_select_from_product").click(function(){
            setId('.product_select',ID);
       });
    $("#url_type_select_from_blog").click(function(){
            setId('.blog_select',ID);
       });
});