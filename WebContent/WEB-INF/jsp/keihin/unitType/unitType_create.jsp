<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/unitType/unitType_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

<input name ="rAction" type="hidden" value="Create">

<!-- <div class="content-wrapper"> -->
<style>
/* Large rounded green border */
hr.style {
/*   border: 1px solid grey; */
  display: block;
  margin-top: 0.5em;
  margin-bottom: 0.5em;
  margin-left: auto;
  margin-right: auto;
  border-style: inset;
  border-width: 1px;
}
</style>

<div class="content-wrapper">
		<section class="content-header">
			<h1 class="page-header">Unit Type - Create</h1>
		</section> 
		
		<hr class="style">
		
		<section class="content">
			<div class="row">
             	<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Unit Type :</b> Create New
                        </div>                        
                        

                       		<div class="panel-body">
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Unit Type Name:</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Unit Type Name" name="unitType_name" value="">
                       				</div>	
                       			</div>                			
                       			<br>                       			
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Status : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<select class="form-control" name="activeFlag" required>
											 <c:forEach var="item" items="${LOV_ACTIVE_FLG}">
										     	<option value="${item.code}" ${item.code == unitTypeBean.activeFlag ? 'selected="selected"' : ''}  >${item.descTH}</option>
										    </c:forEach>				
	                                	</select>
                       				</div>	
                       			</div>
		                        			 	       
	                        </div>
	                        <div class="panel-footer">
		                        <input type ="button" value="Save"   role="button" class="btn btn-info" onclick="doSaveUnitType()" >
                                <a type="reset" class="btn btn-default" href="${cPath}/unitType/unitType_list.htm"  role="button" >Cancel</a>  
	                        </div> 		                        

					</div>     
                    </div>
             	<div class="col-lg-3">
				
				</div>   
				                               
                </div>
                <!-- /.col-lg-4 -->		
		</section>
</div>
   
<!-- </div> -->
            
</form>            

<script type="text/javascript">
 
function doSaveUnitType() {
	var _f = $('#myForm').validator('validate');
	if (_f.has('.has-error').length == 0) {
		 
	bootbox.confirm({
		title : "Confirm",
		message : _confirmSaveTxt,
		buttons : {
			cancel : {
				label : '<i class="fa fa-times"></i> Cancel',
				className : 'btn-danger'
			},
			confirm : {
				label : '<i class="fa fa-check"></i> Confirm',
				className : 'btn-success'
			}
		},
		callback : function(result) {
			if (result) {
				 $("#myForm").submit();
			}
		}
	});
	}
}
</script>