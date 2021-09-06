<link rel="stylesheet" href="css/side_nav.css">
<div class="side_nav">
    <div id="spacer">
    </div>

    <ul id="side_menu">
        <li class="list" style="background-color:black; text-align:center; padding:20px 0">
            <a href="#" style="padding:0;">
                <i class="fa fa-user" style="font-size:3rem;"></i>
                <br> <?php echo $fulname; ?>
                <br> <small> <em><?php echo $design; ?></em> </small>
            </a>
        </li>
        <li class="list">
            <a href="./">
                <i class="fa fa-tachometer-alt"></i> Dashboard
            </a>
        </li>
        <li class="list">
            <a href="#">
                <i class="fa fa-chevron-right tog" style="float:right; color:white; margin:5px 30px"></i>
                <i class="fa fa-money-bill"></i> Accounts
            </a>
            <ul class="sub_menu">
                <!-- <li class="list">
                    <a href="#">
                        <i class="fa fa-money-bill-wave"></i> Financial Planning
                    </a>
                </li>
                <li class="list">
                    <a href="budget.php">
                        <i class="fa fa-swatchbook"></i> budget Control
                    </a>
                </li> -->
                <li class="list">
                    <a href="funds.php">
                        <i class="fa fa-undo-alt"></i> Funds Control
                    </a>
                </li>
                <li class="list">
                    <a href="payments.php">
                        <i class="fa fa-money-check"></i> Payments
                    </a>
                </li>
            </ul>
        </li>
        <li class="list">
            <a href="#">
                <i class="fa fa-chevron-right tog" style="float:right; color:white; margin:5px 30px"></i>
                <i class="fa fa-capsules"></i> Materials
            </a>
            <ul class="sub_menu">
                <li class="list">
                    <a href="products.php">
                        <i class="fa fa-tablets"></i> Prouducts
                    </a>
                </li>
                <li class="list">
                    <a href="sales.php">
                        <i class="fa fa-object-group"></i> Make Sales
                    </a>
                </li>
                <li class="list">
                    <a href="reorder.php">
                        <i class="fa fa-money-bill-wave"></i> Orders Planning
                    </a>
                </li>
                <li class="list">
                    <a href="vendors.php">
                        <i class="fa fa-industry"></i> Vendors
                    </a>
                </li>
                <li class="list">
                    <a href="transactions.php">
                        <i class="fa fa-history"></i> Inventory
                    </a>
                </li>
            </ul>
        </li>
        <li class="list">
            <a href="#">
                <i class="fa fa-chevron-right tog" style="float:right; color:white; margin:5px 30px"></i>
                <i class="fa fa-user-cog"></i> Human Resource
            </a>
            <ul class="sub_menu">
                <li class="list">
                    <a href="humanres.php">
                        <i class="fa fa-money-bill-wave"></i> Employees
                    </a>
                </li>
                <li class="list">
                    <a href="branch.php">
                        <i class="fa fa-warehouse"></i> Branches
                    </a>
                </li>
                <!-- <li class="list">
                    <a href="performance.php">
                        <i class="fa fa-chart-line"></i> Performance
                    </a>
                </li> -->
            </ul>
        </li>
        <li class="list">
            <a href="#">
                <i class="fa fa-chevron-right tog" style="float:right; color:white; margin:5px 30px"></i>
                <i class="fa fa-users"></i> Customers
            </a>
            <ul class="sub_menu">
                <li class="list">
                    <a href="customers.php">
                        <i class="fa fa-user"></i> Customer Details
                    </a>
                </li>
                <li class="list">
                    <a href="transactions.php">
                        <i class="fa fa-history"></i> Transaction History
                    </a>
                </li>
                <!-- <li class="list">
                    <a href="#">
                        <i class="fa fa-thumbs-up"></i> Preference
                    </a>
                </li> -->
            </ul>
        </li>
        <!-- <li class="list">
            <a href="#">
                <i class="fa fa-chevron-right tog" style="float:right; color:white; margin:5px 30px"></i>
                <i class="fa fa-project-diagram"></i> Project Planning
            </a>
            <ul class="sub_menu">
                <li class="list">
                    <a href="#">
                        <i class="fab fa-monero"></i> Monitoring & Evaluation
                    </a>
                </li>
                <li class="list">
                    <a href="#">
                        <i class="fa fa-money-bill-wave"></i> Quality Management
                    </a>
                </li>
                <li class="list">
                    <a href="#">
                        <i class="fa fa-receipt"></i> Top Executives
                    </a>
                </li>
            </ul>
        </li> -->
    </ul>

</div>


<!-- Modal -->
<div class="modal fade" id="product_details" tabindex="-1" role="dialog" aria-labelledby="product_detailsLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="product_detailsLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="alert_modal_12" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-body" id="" style="padding:30px auto; text-align:center;">
        <h1 id="alertMsgIcon"></h1>
        <span id="alertMsgSpan"></span>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="invoice" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-body" id="invoiced" style="padding:0;">
        ...
      </div>
    </div>
  </div>
</div>


<!-- Add Products modal -->

<div class="modal fade" id="addProd" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body p-5" id="invoiced" style="padding:0;">
                <form method="post" name="addProd" id="addProd">
                    <?php 
                        if(isset($_POST['addProd'])){
                            $pname=$_POST['pname'];
                            $CPrice=$_POST['CPrice'];
                            $MPrice=$_POST['MPrice'];
                            $Qunt=$_POST['Qunt'];
                            $Cat=$_POST['Cat'];
                            $xdate=$_POST['xdate'];
                            $branch=$_POST['branch'];
                            $supllier=$_POST['supllier'];
                            $desc=$_POST['desc'];
                            $ser=$_POST['ser'];
                            // connect
                            $conn2 = new MySqli('localhost','root','','project2021_erp');

                            $query2 = $conn2->query('INSERT INTO product 
                            (prod_name, prod_desc, prod_cost_price, prod_price, exp_date, cat_id, prod_qty, branch_id, supplier_id, serial ) VALUES
                            ("'. $pname .'","'. $desc .'","'. $CPrice .'","'. $MPrice .'","'. $xdate.'","'. $Cat .'","'. $Qunt .'","'. $branch.'","'. $supllier .'","'. $ser.'")') or die($conn->error);
                        ?>
                            <script>
                                alert('Product Added Successfully')
                                $('form[name=addBranch]').reset();
                            </script>
                        <?php
                        }
                    ?>
                    <div class="input-group my-2">
                        <input type="text" required name="pname" id="" placeholder="Enter Product Name" class="form-control">
                    </div>
                    <div class="input-group my-2">
                        <input type="text" required name="CPrice" id="" placeholder="Enter Product Cost Price" class="form-control">
                    </div>
                    <div class="input-group my-2">
                        <input type="text" required name="MPrice" id="" placeholder="Enter Product Market Price" class="form-control">
                    </div>
                    <div class="input-group my-2">
                        <input type="text" required name="Qunt" id="" placeholder="Enter Product Quantity" class="form-control">
                    </div>
                    <div class="input-group my-2">
                        <select name="Cat" id="" class="form-control">
                            <option selected disabled>Choose Category Type</option>
                            <?php 
                                $queryCheck = $conn->query("SELECT * FROM category");
                                while($data = $queryCheck->fetch_assoc()){
                                    ?>
                                        <option value="<?php echo $data['cat_id']?>"><?php echo $data['cat_name']?></option>
                                    <?php
                                }
                            ?>
                        </select>
                    </div>
                    <div class="my-2">
                        Enter Product Expiring Date
                        <div class="input-group">
                            <input type="date" required name="xdate" class="form-control">
                        </div>
                    </div>
                    <div class="input-group my-2">
                        <select name="branch" id="" class="form-control">
                            <option selected disabled>Choose Branch</option>
                            <?php 
                                $queryCheck2 = $conn->query("SELECT * FROM branch");
                                while($data2 = $queryCheck2->fetch_assoc()){
                                    ?>
                                        <option value="<?php echo $data2['branch_id']?>"><?php echo $data2['branch_name']?></option>
                                    <?php
                                }
                            ?>
                        </select>
                    </div>
                    <div class="input-group my-2">
                        <select name="supllier" id="" class="form-control">
                            <option selected disabled>Choose Supplier</option>
                            <?php 
                                $queryCheck2 = $conn->query("SELECT * FROM supplier");
                                while($data2 = $queryCheck2->fetch_assoc()){
                                    ?>
                                        <option value="<?php echo $data2['supplier_id']?>"><?php echo $data2['supplier_name']?></option>
                                    <?php
                                }
                            ?>
                        </select>
                    </div>
                    <div class="input-group my-2">
                        <input type="text" required name="ser" id="" placeholder="Enter Product serial" class="form-control">
                    </div>
                    <textarea name="desc" id="" cols="30" rows="10" class="form-control" placeholder="Enter product Description"></textarea>
                    
                    <div class="form-group mt-4">
                        <button class="btn btn-dark btn-block btn-submit" type="submit" name="addProd">
                            <i class="fa fa-sign-alt"></i>
                            Add Product
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



<!-- Add branch modal -->

<div class="modal fade" id="addBranch" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body p-5" id="invoiced" style="padding:0;">
                <form method="post" name="addBranch" id="addBranch">
                    <?php 
                        if(isset($_POST['addB'])){
                            $bname = $_POST['bname'];
                            $Aname = $_POST['Aname'];
                            $cont = $_POST['cont'];
                            // $skin = $_POST['skin'];

                            // connect
                            $conn2 = new MySqli('localhost','root','','project2021_erp');

                            $query2 = $conn2->query('INSERT INTO branch (branch_name, branch_address, branch_contact) VALUES("'. $bname .'","'. $Aname .'","'. $cont .'")') or die($conn->error);
                        ?>
                            <script>
                                alert('Branch Added Successfully')
                                $('form[name=addBranch]').reset();
                            </script>
                        <?php
                        }
                    ?>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="btn btn-warning">
                                <i class="fa fa-warehouse"></i>
                            </span>
                        </div>
                        <input type="text" required name="bname" id="" placeholder="Enter Branch Fullname" class="form-control">
                    </div>
                    <div class="input-group my-3">
                        <div class="input-group-prepend">
                            <span class="btn btn-warning">
                                <i class="fa fa-phone"></i>
                            </span>
                        </div>
                        <input type="text" required name="cont" id="" placeholder="Enter Branch Contact" class="form-control">
                    </div>
                    <div class="input-group my-3">
                        <div class="input-group-prepend">
                            <span class="btn btn-warning">
                                <i class="fa fa-warehouse"></i>
                            </span>
                        </div>
                        <input type="text" required name="Aname" id="" placeholder="Enter Branch Address" class="form-control">
                    </div>
                    <!-- <div class="input-group my-3">
                        <div class="input-group-prepend">
                            <span class="btn btn-warning">
                                <i class="fa fa-warehouse"></i>
                            </span>
                        </div>
                        <input type="text" required name="skin" id="" placeholder="Enter Branch Skin" class="form-control">
                    </div> -->
                    
                    <div class="form-group">
                        <button class="btn btn-dark btn-block btn-submit" type="submit" name="addB">
                            <i class="fa fa-sign-alt"></i>
                            Add Branch
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>



 <!--~~~~~~~ Add user modal ~~~~~~-->
<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body p-5" id="invoiced" style="padding:0;">
        <form method="post" name="login_form" id="login_form">    
            <?php 
                if(isset($_POST['submit'])){
                    $fname = $_POST['fname'];
                    $lname = $_POST['lname'];
                    $phone = $_POST['phone'];
                    $email = $_POST['email'];
                    $desig = $_POST['desig'];
                    $uname = $_POST['uname'];
                    $pass = $_POST['pass'];
                    $pass = md5($pass);

                    // connect
                    $conn = new MySqli('localhost','root','','project2021_erp');

                    $query = $conn->query('INSERT INTO users(firstname, lastname, phone, email, designation, user_name, password) VALUES("'. $fname .'","'. $lname .'","'. $phone .'","'. $email .'","'. $desig .'","'. $uname .'","'. $pass .'")') or die($conn->error);
                   ?>
                        <script>
                            alert('User Added Successfully')
                            $('form[name=login_form]').reset();
                        </script>
                   <?php
                }
            ?>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
                <input type="text" required name="fname" id="uname" placeholder="Firstname" class="form-control">
            </div>
            <small class="alert fade" id="uname_val"></small>

            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
                <input type="text" required name="lname" id="pass" placeholder="Lastname" class="form-control">
            </div>
            <small class="alert fade" id="pass_val"></small>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
                <input type="text" required name="phone" id="uname" placeholder="Phone Number" class="form-control">
            </div>
            <small class="alert fade" id="uname_val"></small>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
                <input type="email" required name="email" id="pass" placeholder="Email" class="form-control">
            </div>
            <small class="alert fade" id="pass_val"></small>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
                <input type="text" required name="desig" id="uname" placeholder="Designation" class="form-control">
            </div>
            <small class="alert fade" id="uname_val"></small>

            <small class="alert fade" id="pass_val"></small>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
                <input type="text" required name="uname" id="uname" placeholder="USER ID" class="form-control">
            </div>
            <small class="alert fade" id="uname_val"></small>

            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-key"></i>
                    </span>
                </div>
                <input type="text" required name="pass" id="pass" placeholder="PASSWORD" class="form-control">
            </div>
            <small class="alert fade" id="pass_val"></small>
            <div class="form-group">
                <button class="btn btn-dark btn-block btn-submit" type="submit" name="submit" id="btnLogin">
                    <i class="fa fa-sign-alt"></i>
                    Add User
                </button>
            </div>
        </form>
      </div>
    </div>
  </div>
</div>


<!-- SALES Modal -->
<div class="modal fade" id="process_sales" tabindex="-1" role="dialog" aria-labelledby="detail_sale" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="detail_sale">SALE ID 
                            <?php
                                if(isset($_SESSION['SALES_ID'])){
                                    echo ' : ' . $_SESSION['SALES_ID'];
                                }
                            ?>
                            </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    <form method="post" name="frm_sale">
      <div class="modal-body">
        <div id="process_detail">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <td>
                            <strong>Customer Firstname: </strong> <br />
                            <div class="form-group">
                                <div class="input-group">
                                    <input class="form-control" type="text" name="fname" id="" required>
                                </div>
                            </div>
                        </td>
                        <td>
                            <strong>Customer Lastname: </strong> <br />
                            <div class="form-group">
                                <div class="input-group">
                                    <input class="form-control" type="text" name="lname" id="" required>
                                </div>
                            </div>  
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <strong>Customer Address: </strong> <br />
                            <div class="form-group">
                                <div class="input-group">
                                    <input class="form-control" type="text" name="address" id="" required>
                                </div>
                            </div>
                        </td>
                        <td>
                            <strong>Customer Phone Number: </strong> <br />
                            <div class="form-group">
                                <div class="input-group">
                                    <input class="form-control" type="tel" name="phone" id="" required>
                                </div>
                            </div>  
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <strong>Customer Email Address: </strong> <br />
                            <div class="form-group">
                                <div class="input-group">
                                    <input class="form-control" type="email" name="email" id="" required>
                                </div>
                            </div>
                        </td>
                        <td>
                            <strong>Number of Items: </strong> <br />
                            <div class="form-group">
                                <div class="input-group">
                                    <span id="total_qty"></span>
                                    <input type="hidden" name="total_qty">
                                </div>
                            </div>  
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="text-align:right;">
                            <strong>Total Amount: </strong>
                            <span id="total_price"></span>
                            <input type="hidden" name="total_price">
                        </td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
      </div>
      <div class="modal-footer">
        <input type="hidden" name="sales_id">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary save_sales">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div>