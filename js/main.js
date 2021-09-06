$(document).ready(function(){
    
    $hd_height = $('header').height();
    $content_top = $hd_height + 50;
    $hd_height = $hd_height + 8;
    $hd_height = $hd_height + 'px';
    $content_top = $content_top + 'px';
    $('#spacer').css({
        'height' : $hd_height,
        'width' : '100%',
        'margin-top' : $hd_height,
     });
     $('.content').css({
        'height' : $content_top,
        'margin-top' : $content_top,
        'padding' : '2px',
     });

     $('.list a').on('click', function(){
        $(this).siblings('ul.sub_menu').slideToggle('fast');
        $arrow = $(this).children('a').children('i.tog');
        if($arrow.hasClass('fa-chevron-right')){
            $arrow.removeClass('fa-chevron-right');
            $arrow.addClass('fa-chevron-down');
        }else{
            $arrow.removeClass('fa-chevron-down');
            $arrow.addClass('fa-chevron-right');
        }
     });

    // var table = $('#pro_table').DataTable( {} );

    $('.pro_content').on('click', 'a.btn-success', function(){
        jQuery.noConflict();
        $product_id = $(this).parent('td').attr('id');
        // $('#pro_table').DataTable().ajax.reload();
        $('#product_details').on('show.bs.modal', function(){
            $('#product_detailsLabel').html('Modal Recived : ' + $product_id);
        });
        $('#product_details').modal('show');
    });

    $('#process_btn').on('click', function () {
        jQuery.noConflict();
        $('#process_sales').on('show.bs.modal', function () {
            $sales_id = $('#sale_id').text();
            $.ajax({
                type : 'post',
                url : 'ajax/process_sales.php',
                data : {sales_id: $sales_id},
                dataType:"json",
                success : function(data){
                    if(data.status == "ok"){
                        $('input[name=sales_id]').val(data.sales_id); 
                        $('#total_qty').html(data.quantity);
                        $('input[name=total_qty]').val(data.quantity);
                        $('#total_price').html('&#8358; '+data.total.toLocaleString());
                        $('input[name=total_price]').val(data.total);
                    }else{
                        $('#total_qty').html(data.status);
                    }
                },
                error : function(data, status, error){
                    console.error(status + ' - ' + error);
                }
            });
        });
        $('#process_sales').modal('show');
    })

    $('#pro_table').on('click', 'i.fa-cart-plus', function(){
        jQuery.noConflict();
        $product_id = $(this).parent('a').parent('td').attr('id');
        $.ajax({
            type : 'post',
            url : 'ajax/add_product_sale.php',
            data : {id: $product_id},
            success : function(data){
                if(parseInt(data) == 1){
                    console.log(data + ": A Error Occured");
                }else if(parseInt(data) == 2){
                    $('#alert_modal_12').on('show.bs.modal', function(){
                        $('#alertMsgIcon').html('<i class="fa fa-times-circle" style="color:#dd4b39;"></i>');
                        $('#alertMsgSpan').html('<h3><strong>ATTENTION!</strong></h3> <p>This product is no more available. Please contact management for re-order.</p>');
                    });
                    $('#alert_modal_12').modal('show');
                    console.log("No Product Left");
                }else{
                    $('#sale_id').html(' - ID:' + data);
                    displayCart(data);
                }
            },
            error : function(data, status, error){
                console.error(status + ' - ' + error);
            }
        });
    });

    function displayCart($sales_id){
        $.ajax({
            type : 'post',
            url : 'ajax/display_cart.php',
            data : {sale_id: $sales_id},
            success : function (table) {
                $('#sel_products').html(table);
            }
        });
    }
    displayCart("");

    $('form[name=frm_sale]').on('submit', function (e) {
        e.preventDefault();
        $data = $('form[name=frm_sale]').serialize();
        $.ajax({
            type : 'post',
            url : 'ajax/save_sales.php',
            data : {data:$data},
            dataType : 'json',
            success : function (result) {
                console.log(result.status);
                if(result.status == 2){
                    $('form[name=frm_sale]').trigger('reset');
                    $('#invoice').on('show.bs.modal', function () {
                        $.ajax({
                            type : 'post',
                            url : 'ajax/invoice.php',
                            data : {sale_id: result.sales},
                            success : function (page) {
                                $('#process_sales').modal('hide');
                                $('#process_sales').on('hidden.bs.modal', function () {
                                    $('#sales_body').addClass('modal-open');
                                    // alert($('#sales_body').hasClass('modal-open'));
                                })
                                $('#invoiced').html(page);
                            }
                        });
  
                    });
                    $('#invoice').modal('show');
                    $('#invoice').on('hidden.bs.modal', function () {
                        window.location = "";
                    })
                    
                }else{
                    alert("An Error Occured!")
                }
            }
        });
        
    });

    $('.btn-view_sale').on('click', function(){
        $id = $(this).attr('id');
        $.ajax({
            type : 'post',
            url : 'ajax/invoice.php',
            data : {sale_id: $id},
            success : function (page) {
                $('#invoice').on('show.bs.modal', function () {
                $('#invoiced').html(page);
                });
                $('#invoice').modal('show');
            }
        });
    });

    $('#clearcart_btn').on('click', function(){
        $checksales = $('#sale_id').html();
        $.ajax({
            type : 'post',
            url : 'ajax/clear_cart.php',
            data : {sale_id: $checksales},
            success : function (data) {
                if(data == 1){
                    $('#sale_id').html('');
                    $('#alert_modal_12').on('show.bs.modal', function(){
                        $('#alertMsgIcon').html('<i class="fa fa-check-circle" style="color:darkgreen;"></i>');
                        $('#alertMsgSpan').html('<h3><strong>SUCCESS!</strong></h3> <p>Products have been cleared successfully from cart!</p>');
                    });
                    displayCart("");
                    $('#alert_modal_12').modal('show');
                }else if(data == 0){
                    $('#alert_modal_12').on('show.bs.modal', function(){
                        $('#alertMsgIcon').html('<i class="fa fa-trash" style="color:#dd4b39;"></i>');
                        $('#alertMsgSpan').html('<h3><strong>EMPTY CART!</strong></h3> <p>No item currently on the cart.</p>');
                    });
                    $('#alert_modal_12').modal('show');
                }else{
                    $('#alert_modal_12').on('show.bs.modal', function(){
                        $('#alertMsgIcon').html('<i class="fa fa-times-circle" style="color:#dd4b39;"></i>');
                        $('#alertMsgSpan').html('<h3><strong>ATTENTION! Error!!</strong></h3> <p>An error occured while trying to clear products from cart.</p>');
                    });
                    $('#alert_modal_12').modal('show');
                }
                console.log(data);
            }
        });
    });


    $('#pro_table').on('click', 'button.btn-order', function(){
        jQuery.noConflict();
        $id = $(this).attr('id');
        $qty = prompt("Please, Enter the Quanttity to Order!");
        $.ajax({
            type : 'post',
            url : 'ajax/add_product_order.php',
            data : {id: $id, qty: $qty},
            dataType : 'json',
            success : function(data){
                $('span#id').text(data.order_id);
                $('span#amount').text(data.amount);
                displayOrderCart(data.order_id);
            },
            error : function(data, status, error){
                console.error(status + ' - ' + error);
            }
        });
    });

    function displayOrderCart($order_id){
        $.ajax({
            type : 'post',
            url : 'ajax/display_ordercart.php',
            data : {order_id: $order_id},
            success : function (table) {
                $('#sel_orders').html(table);
            }
        });
    }
    displayOrderCart("");

    $('#save_order').on('click', function(){
        $action = "save";
        $.ajax({
            type : 'post',
            url : 'ajax/process_order.php',
            data : {action: $action},
            success : function (data) {
                if(data == 2){
                    $('#alert_modal_12').on('show.bs.modal', function(){
                        $('#alertMsgIcon').html('<i class="fa fa-check-circle" style="color:darkgreen;"></i>');
                        $('#alertMsgSpan').html('<h3><strong>SUCCESS!</strong></h3> <p>Order/Purchase request was placed successfully!</p>');
                    });
                    displayOrderCart("");
                    $('#alert_modal_12').modal('show');
                    $('#alert_modal_12').on('hidden.bs.modal', function(){
                    window.location = "";
                    });
                }else{
                    $('#alert_modal_12').on('show.bs.modal', function(){
                        $('#alertMsgIcon').html('<i class="fa fa-times-circle" style="color:#dd4b39;"></i>');
                        $('#alertMsgSpan').html('<h3><strong>ATTENTION! Error!!</strong></h3> <p>An error occured while trying to save purchase request.</p>');
                    });
                    $('#alert_modal_12').modal('show');
                }
            }
        });
    });



    $('#adduser').on('show.bs.modal', function () {

    })


    $('#clear_order').on('click', function(){
        $action = "clear";
        $.ajax({
            type : 'post',
            url : 'ajax/process_order.php',
            data : {action: $action},
            success : function (data) {
                if(data == 2){
                    $('#alert_modal_12').on('show.bs.modal', function(){
                        $('#alertMsgIcon').html('<i class="fa fa-check-circle" style="color:darkgreen;"></i>');
                        $('#alertMsgSpan').html('<h3><strong>SUCCESS!</strong></h3> <p>Order Cart Cleard Successfully!</p>');
                    });
                    displayOrderCart("");
                    $('#alert_modal_12').modal('show');
                    $('#alert_modal_12').on('hidden.bs.modal', function(){
                        window.location = "";
                        });
                }else{
                    $('#alert_modal_12').on('show.bs.modal', function(){
                        $('#alertMsgIcon').html('<i class="fa fa-times-circle" style="color:#dd4b39;"></i>');
                        $('#alertMsgSpan').html('<h3><strong>ATTENTION! Error!!</strong></h3> <p>An error occured while trying to clear order cart.</p>');
                    });
                    $('#alert_modal_12').modal('show');
                }
            }
        });
    });



    

});