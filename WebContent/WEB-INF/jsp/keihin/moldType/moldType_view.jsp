<!DOCTYPE HTML>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/resources/adminLTE/common.jsp"%>
<body class="${bodySkin}">
<%@ include file="/WEB-INF/jsp/she-navbar.jsp"%>
<%@ include file="/WEB-INF/jsp/she-sidebar.jsp"%>


<form action="${cPath}/moldType/moldType_save.htm" method="post" id="myForm" data-toggle="validator" novalidate="true">

<input name ="rAction" type="hidden" value="Delete">

<style>
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
			<h1 class="page-header">Model / Type - View</h1>
		</section> 
		<hr class="style">
		
		<section class="content">
		
            <div class="row">
             	<div class="col-lg-3">
				
				</div>   
				           
            	<div class="col-lg-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <b>Model / Type :</b> ${moldTypeBean.moldType_name}
                        </div>                        
                        
                       		<div class="panel-body">
		       					
		                        <div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Model / Type ID : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Mold Type ID" name="moldType_ID" value="${moldTypeBean.moldType_ID}" readonly>
                       				</div>	
                       			</div>
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Model / Type Name : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Mold Type Name" name="moldType_name" value="${moldTypeBean.moldType_name}" readonly>
                       				</div>	
                       			</div>                       			
                       			<br>
                       			<div class="row">
                       				<div class="col-lg-4">
                       					<p class="help-block"><b>Status : </b></p>
                       				</div>
                       				<div class="col-lg-8">
                       					<input type="text" class="form-control" placeholder="Status" name="activeFlag_name" value="${moldTypeBean.activeFlag_name}" readonly>
                       				</div>	
                       			</div>
		                        					 	       
	                        </div>
	                        <div class="panel-footer">
		                        <input type ="button" value="Delete" name="rAction" role="button" class="btn btn-info" onclick="doDel('${moldTypeBean.moldType_ID}')">
						 	  	<a href="${cPath}/moldType/moldType_edit.htm?moldType_ID=${moldTypeBean.moldType_ID}" class="btn btn-warning" role="button" aria-pressed="true" value="edit" name="rAction">Edit</a>
						 	  	<a href="${cPath}/moldType/moldType_list.htm" class="btn btn-secondary" role="button" aria-pressed="true">Back to List</a>  	
	                        </div> 		                        

					</div>     
                    </div>
             	<div class="col-lg-3">
				
				</div>   
                   
                </div>
                <!-- /.col-lg-4 -->
                </section>
           	</div>

            
</form>  
          
<script type="text/javascript">
 	function doDel(moldType_ID){
			bootbox.confirm({
			    title: "Confirm",
			    size: 'small',
			    message: _confirmDelTxt,
			    buttons: {
			        cancel: {
			            label: '<i class="fa fa-times"></i> Cancel'
			        },
			        confirm: {
			            label: '<i class="fa fa-check"></i> Confirm',
			            className: 'btn-success'
			        }
			    },
			    callback : function(result) {
					if (result) {
						 $("#myForm").submit();
					}
				}
			});
		};
</script>  