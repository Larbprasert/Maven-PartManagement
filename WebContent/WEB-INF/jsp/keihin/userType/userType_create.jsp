 <!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>

  
<form action="${cPath}/userType/userType_save.htm" method="post" id="myForm" data-toggle="validator" >

<input name ="rAction" type="hidden" value="Create">

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">User Type - Create</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="row">
            	<div class="col-lg-3">
				
				</div>
				            

				<div class="col-lg-6">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <b>User Type :</b> Create New 
                        </div>
                        

                       		<div class="panel-body">
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>User Type Name:</b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="User Type Name" name="userType_name" value="" required="required">
                       					<div class="help-block with-errors"></div>
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
												     	<option value="${item.code}" ${item.code == userTypeBean.activeFlag ? 'selected="selected"' : ''}  >${item.descTH}</option>
												    </c:forEach>				
	                                	</select>
                       				</div>
                       			</div>
                                  	                        					 	       
	                        </div>
	                        
	                        <div class="panel-footer">
                                <input type ="button" value="Save"   role="button" class="btn btn-info" onclick="doSaveUserType()" >
                                <a type="reset" class="btn btn-default" href="${cPath}/userType/userType_list.htm"  role="button" >Cancel</a> 
                                
	                        </div> 	                      

					</div>  
                </div>
                
            	<div class="col-lg-3">
				
				</div>                
           	</div>
                <!-- /.col-lg-4 -->
		</div>

            
</form>            


<script type="text/javascript">
 
function doSaveUserType() {
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