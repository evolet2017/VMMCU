﻿<%@ Page Language   ="C#" 
    AutoEventWireUp ="true" 
    ViewStateEncryptionMode="Always" EnableSessionState="True" Culture="Auto" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="generator"
    content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
    <meta charset="UTF-8" />
    <title>MBv8 Accounting | Transactions for the day</title>
    <!-- bootstrap 3.0.2 -->
        <link href="/html/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="/html/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="/html/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="/html/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="/html/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <link href="/html/css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />
        <!-- Daterange picker -->
        <link href="/html/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <link href="/html/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="/html/css/AdminLTE.css" rel="stylesheet" type="text/css" />
	     <!-- DATA TABLES -->
        <link href="/html/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="/html/css/datatables/jquery.dataTables.css" rel="stylesheet" type="text/css" />

        <script src="/html/js/jquery.js"></script>

        <script src="/html/js/mbphillib.js"></script>
        <script src="/html/js/bootbox.js"></script>
        <script src="/html/js/msgbox.js"></script>
        <script src="/html/js/bankdisburse.js"></script>
		 <script src="/html/js/accounting.min.js"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="/html/js/html5shiv.js"></script>
          <script src="/html/js/respond.min.js"></script>
        <![endif]-->
      <script runat="server">
          void Page_Load()
          {
              if (Request.Cookies["isactive"] != null)
              {
                  if (Request.Cookies["isactive"].Value != "1")
                  {
                      Response.Redirect("/Login");
                  }
              }
              else
              {
                  Response.Redirect("/Login");
              }
          }
      </script>
  </head>
  
 <body class="skin-black">
  <!-- header logo: style can be found in header.less -->
   <header class="header">
  <a href="/Main" class="logo">
  <!-- Add the class icon to your logo image or logo icon to add the margining -->
  MBv8 Accounting</a> 
  <!-- Header Navbar: style can be found in header.less -->

	
	   <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
	
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->                        
                        <!-- User Account: style can be found in dropdown.less -->
                       <% Response.WriteFile("~/html/useraccount.htt"); %>
                    </ul>
                </div>
            </nav>
  </header>



  <div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="left-side sidebar-offcanvas">
      <!-- sidebar: style can be found in sidebar.less -->
      <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
                                  <%--<div class="pull-left image">
                            <img src="/html/img/img.img" class="img-circle" alt="User Image" />
                        </div>--%>
          <div class="pull-left info">
            <p><% Response.Write("Todays Date : " + Request.Cookies["activedate"].Value); %></p>
            <a href="#"><i class="fa fa-circle text-success"></i>  Online</a>
          </div>
        </div>

     <ul class="sidebar-menu">
         <% Response.WriteFile("~/html/menu.htt"); %>
     </ul> 

    </section>
      <!-- /.sidebar -->
    </aside>
    <!-- Right side column. Contains the navbar and content of the page -->
    <aside class="right-side">
      
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>Loan Disbursement</h1>
        <ol class="breadcrumb">
          <li>
            <a href="/Main">Dashboard</a>
          </li>
          <li class="active">Loan Listing</li>
        </ol>
      </section>
      <!-- Main content -->
      <section class="content">
        
		<div class="row">
		
			  <div class="col-md-12">
			   
			   
					<div class="nav-tabs-custom">
			   

					  
			   
							<div class="tab-content">	
			   
	
							<div id="tab_1" class="tab-pane active">
									<div class="panel box box-success">
													<div class="box-header">
													<h3 class="box-title">For Disbursement</h3>
													</div><!-- /.box-header -->
													
													
													<div class="box-body">
														<table class="table table-bordered table-striped" id="tblsharewith">
															<thead><tr>
																<th>#</th>
																<th>Disbursement Date</th>
																<th>Client Name</th>
																<th>Check Amount</th>
																<th>Check Number</th>
																<th>Action</th>
																</tr>
                                                            </thead>
															<tbody>
														    </tbody>
                                                        <tfoot>
                                                            
                                                            <tr>
																<td>&nbsp;</td>
																 <td>&nbsp;</td>
																<td><strong>TOTAL</strong></td>
																<td align="right"><strong><div id="total"></div></strong></td>
																<td>&nbsp;</td>
															    <td>&nbsp;</td>
															</tr>
                                                        </tfoot>

														</table>
													</div><!-- /.box-body -->
												</div><!-- /.box -->
							</div><!-- end of tab 1-->
							
									
							</div><!-- tab content -->
							
					
									
		
								
								
								
					</div> <!-- nav tabs -->
								
								</div> <!-- col -->
								
								
								</div> <!-- row -->
		
        <!-- wrapper -->
      </section>
    </aside>
  </div>

  <div class="modal fade" id="swmanager" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-dollar"></i> Disbursement Details</h4>
                    </div>
                   
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="" class="text-blue">Select Bank Account</label> 
                                <select class="form-control input-lg text-green" id="frmShareSelect"  onchange="BankDisburse.bankdisburseinfo(this.value)">                                                                  
                                </select>

                                    <div class="box-body">
                                        <table>
                                            <tr>
                                                <td width="150px">Account Type</td>
                                                <td>:</td>
                                                <td><div id="accttype"></div></td>
                                            </tr>
                                                <tr>
                                                <td width="150px">Account number</td>
                                                    <td>:</td>
                                                <td><div id="acctnum"></div></td>
                                            </tr>
                                            <tr>
                                                <td width="150px">General Ledger Code</td>
                                                <td>:</td>
                                                <td><div id="glcode"></div></td>
                                            </tr>
                                            <tr>
                                                <td width="150px">Balance</td>
                                                <td>:</td>
                                                <td><div id="glBalance"></div></td>
                                            </tr>
                                    
                                        </table>
                                   
                                    
                                    </div>

                            </div>
																															
					        <div class="form-group">
							        <label>Client Name</label>
							        <input type="text" id="clientName" placeholder="" class="form-control" readonly="true">
					        </div>
															
					        
																
					        <div class="form-group">
							        <label>Check Number</label>
							        <input type="text" id="checkNumber" placeholder="" class="form-control numbersOnly">
					        </div>
                            <div class="form-group">
							        <label>Date</label>
							        <input type="date" id="checkDate" class="form-control">
					        </div>
                            <div class="form-group">
							        <label>Withdrawal Amount</label>
							        <input type="text" id="checkAmount" placeholder="" class="form-control" readonly="true">
					        </div>

                            <div class="form-group">
							        <label>Reference</label>
							        <input type="text" id="checkReference" placeholder="" class="form-control">
					        </div>

                            <div class="form-group">
							        <label>Particulars</label>
							        <input type="text" id="checkParticular" placeholder="" class="form-control">
					        </div>
                            <input type="hidden" id="checkid"/>

                        </div>
                        <div class="modal-footer clearfix">
                            <input type="hidden" id="idptr"/>
                            <button type="button" id="discard" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>

                            <button type="submit" id="postit" class="btn btn-primary pull-left" onclick="BankDisburse.bankdisbursesave();"><i class="fa  fa-thumbs-o-up"></i> Post Entry</button>
                        </div>
                 
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

  <!-- Main row -->
  <!-- /.content -->
  <!-- /.right-side -->
  <!-- ./wrapper -->
  <!-- add new calendar event modal -->
  <!-- jQuery 2.0.2 -->
 <script src="/html/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- DATA TABES SCRIPT -->
        <script src="/html/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="/html/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <!-- InputMask -->
        <script src="/html/js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="/html/js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="/html/js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
        <!-- date-range-picker -->
        <script src="/html/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <!-- bootstrap color picker -->
        <script src="/html/js/plugins/colorpicker/bootstrap-colorpicker.min.js" type="text/javascript"></script>
        <!-- bootstrap time picker -->
        <script src="/html/js/plugins/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="/html/js/AdminLTE/app.js" type="text/javascript"></script>
       

       


       <script>

           BankDisburse.bankdisbursebanklist();
         //  BankDisburse.bankdisburseinfo($('#frmShareSelect').val());
           BankDisburse.bankdisburseload();
           //alert($('#frmShareSelect option:selected').text());
           // var s = "select * from appconfig"
           // s = MB.push(s);
           //  console.log('s value ' + s);
           $('.numbersOnly').keyup(function () {
               if (this.value != this.value.replace(/[^0-9\.\$]/g, '')) {
                   this.value = this.value.replace(/[^0-9\.\$]/g, '');
               }
           });



           function disbursecheck() {


              // console.log($('#clientName').val());
              // console.log($('#checkAmount').val());
              // console.log($('#checkNumber').val());
              // console.log($('#checkReference').val());
               //  console.log($('#remarks').val());
               //bootbox.alert("<h2>test</h2>test");
           }



       </script>



 </body>
</html>
