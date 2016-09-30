<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('#registForm').validate({
			submitHandler: function() {
				var formData = $("#registForm").serialize();
				var actionUrl = $("#registForm").prop("action");
				$.ajax({
					type:"POST",
					url:actionUrl,
					data:formData,
					dataType:"json",
					success: function(data){
						if(data.result == "S"){
							alert("글이 정상적으로 등록되었습니다.");
							location.href="/board/";
						}else{
							console.log(data);
							alert("등록에 실패하였습니다.");
						}
					}
				});
			},
			rules:{
				title:{
					required:true
				},
				writer:{
					required:true
				}
			},
			message:{
				title:{
					required:"<br /><span class='alert_msg'>제목을 입력해 주세요</span>"
				},
				writer:{
					required:"<br /><span class='alert_msg'>글쓴이를 입력해 주세요</span>"
				}
			}
		});
		
	});
</script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div>
				<!-- /.box-header -->

				<form id="registForm" role="form" method="post" action="/board/boardRegist">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> <input type="text"
								name='title' class="form-control" placeholder="Enter Title">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3"
								placeholder="Enter ..."></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input type="text"
								name="writer" class="form-control" placeholder="Enter Writer">
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
