<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp" %>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


   <div class="content-wrapper">
        
            <section class="content-header">
                <h3><i class="fa fa-list"></i> Request List  </h3>
                
            </section>
            
            <section class="content">
         


		<div class="row"><div class="col-lg-12">
		
		

<!-- 	#####  SEARCH >>>>> ####------------------- -->
		
		
<!-- 		  <fieldset><div class="well"> -->
 <div class="box box-primary">
 
		 <div class="box-header with-border">
              <h3 class="box-title">Criteria</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
         </div>
          
          <div class="box-body">
            
		   <form class="form-horizontal" id="myForm" commandname="sysParam" method="post"> 
		    
		      <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramType" class="col-lg-4 control-label">Department</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="department">
                       		<option value="">--- ALL ---</option>
                       	 	<option value="">SHE    </option> 
							<option value="">VP1    </option> 
							<option value="">VP2    </option> 
							<option value="">QR-POM </option> 
							<option value="">QR-VP  </option> 
							<option value="">QC-PT  </option> 
							<option value="">RD-PT  </option> 
							<option value="">POM    </option> 
							<option value="">MT     </option> 
                      </select>
                    </div>
                  </div>
             </div>
	          
	          
	           <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramCode" class="col-lg-4 control-label">Equipment Code</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="">
                    </div>
                  </div>
             </div>
	          
             
		      <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramDesc" class="col-lg-4 control-label">Serial No.</label>
                    <div class="col-lg-6">
                       <input type="text" class="form-control" name="" >
                    </div>
                  </div>
             </div>
	          
	          
	          <div class="col-lg-6">
	          <div class="form-group">
                    <label for="paramStatus" class="col-lg-4 control-label">Request Status</label>
                    <div class="col-lg-6">
                       <select class="form-control" name="active">
                       	<option value="">--- ALL ---</option>
                       	 
					        <option value="">New Request</option>
					        <option value="">Send Approve</option>
					        <option value="">Approve</option>
					        <option value="">Acknowledge Receive</option>
					        <option value="">Sending to Vendor</option>
					        <option value="">Receive from Vendor</option>
					        <option value="">Comfirm Receive</option>
					    
                      </select>
                      
                    </div>
                  </div>
             </div>
	          

				<div class="row">
					<div class="col-lg-12">
						<div class="form-group "> 
							<div class="col-lg-12 text-center">
								<button type="reset" class="btn btn-default" onclick="doClear()"> &nbsp;<i class="fa fa-refresh"></i> Clear</button>&nbsp;&nbsp;
								<button type="button" id="searchBtn" class="btn btn-primary" onclick="doSearch()"><i class="fa fa-search"></i> Search</button>&nbsp;&nbsp;
<!-- 								<button type="button" class="btn btn-warning" disabled>Export <i class="fa fa-file-excel-o"></i></button> -->
							</div>
						</div>
					</div>
				</div>

				</form>
				</div>
<!--             </fieldset> -->
            
        </div>
        </div>
        </div>
<!-- 	##### <<<<<  SEARCH ####------------------- -->
	
		<!-- 	##### <<<<<  TABLE RESULT ####------------------- -->
<!-- 		<button type="button" class="btn btn-primary" onclick="doAdd()"><i class="fa fa-plus"></i>&nbsp;Add Parameter</button> -->
<!-- 		  <br> -->
<!-- 		  <br> -->
		  <div class="box box-primary"   id="rs_table"> 
			 <div class="box-header with-border">
	              <h3 class="box-title">Result</h3>
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool btn-info btn-table"  onclick="doSendMail()"><i class="fa fa-circle-o"></i> Acknowledge
	                </button>
<!-- 	                <button type="button" class="btn btn-box-tool btn-info btn-table"  onclick="doSendMail()"><i class="fa fa-envelope-o"></i> Send -->
<!-- 	                </button> -->
	              </div>
	            </div>
		 
		 	<div class="box-body"> 
 
 
			 <table  id="result-table" class="table table-striped  dataTable no-footer" style="width:100%">
				<thead  align="center" >
					<tr>
					<th align="center" > <label>
                       All <input type="checkbox">   
                      </label> </th>
					<th align="center" >Department</th>
					<th align="center" >Job No.</th>
<!-- 					<th align="center" >Serial No.</th> -->
<!-- 					<th align="center"  >Brand</th> -->
					<th align="center"  >Model</th>
					<th align="center" >Serviced By</th>
					<th align="center" >Cal. Time Std.</th>
					<th align="center"  >Last Cal. Date</th>
					<th align="center" >Next Cal. Date</th>
					<th align="center" >Status</th>
					</tr> 
				</thead>
				<tbody>
				
					 
					 
					</tbody>
				</table>
			 
 
	 
				</div>
			
		</div>
		
<!-- 	<hr> -->
	

	
	
	
		<!-- 	##### <<<<< JAVASCRIPT ####------------------- -->
 <script>
 	
 	function doAdd(){
// 		location = "user_add_edit.php";
		
 		$('#editModal').modal('show');
 	}
 	
 	function doSearch(){
		$("#rs_table").show();
	}

	function doClear(){
		$("#rs_table").hide();
	}

	 $('#result-table').DataTable({
		 ordering: false
	});
	 
	 
	 $(document).ready(function() {
		 
// 	 	$('#editModal').modal('toggle');
		 
	 });
	 

		/* var rsTable = $('#result-table').DataTable({
			autoWidth: false,
			data:[],
		    columns: [
		     	{ 
		     		"data": "paramCode"
		     		,"sWidth": "2%"
			        ,"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
			            var txt = $roleEdit? "<a href='/SHEPortal/param/paramEdit.htm?paramId="+oData.paramId+"'><i class='fa fa-edit fa-lg'></i></a>" : "";
			        	if($roleEdit&&$roleDel){ txt +=	"&nbsp;|&nbsp;" };
			        	if($roleDel){ txt += "<a href='javascript:void(0)' onclick=\"doDel('"+oData.paramId+"','"+oData.paramCode+"')\"><i class='fa fa-trash-o fa-lg'></i></a>" };
			            $(nTd).html(txt);
			        } 
	            },
		     	{ "data": "paramCode","sWidth": "5%" },
				{ "data": "paramType","sWidth": "10%" },
				{ "data": "descTh","sWidth": "10%" },
				{ "data": "descEn","sWidth": "10%" }, 
				{ "data": "active" ,"sWidth": "5%"},
				{ "data": "sortNo" ,"sWidth": "5%"},
				{ "data": "createDateStr" ,"sWidth": "5%"}
		    ],
		    "aoColumnDefs": [
		      { "sClass": "text-center", "aTargets": [0,1,2,5,6,7] }
		    ],
		    ordering: false,
	   	   	destroy: true
		 }); */
		
		/* $("#searchBtn").click(function(){
		  	doSearch();
        }); */
		
	
</script>
	

     </section>
            
</div>


