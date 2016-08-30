<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<style type="text/css">
	.row {
		margin-left: -15px;
    	margin-right: -15px;
	}
	.panel {
		margin-left: 15px;
    	margin-right: 15px;
	}
	h1, h2, h3 {
		line-height: 20px;
	}

</style>
<div class="row">
		<div class="col-lg-12">
		<h3 class="page-header"><i class="fa fa-user"></i>个人信息</h3>
		<ol class="breadcrumb">
			<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
			<li><i class="fa fa-file-text"></i>博客模块</li>		  	
			<li><i class="fa fa-user"></i>个人信息</li>				
		</ol>
	</div>
	<div class="row profile">	
		<div class="col-md-5">	
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="text-center">
						<img class="img-profile" src="${staticPath }/${currentUser.headimgurl}">
					</div>	
					<h3 class="text-center"><strong>${currentUser.loginname}</strong></h3>
					<h4 class="text-center"><small><i class="fa fa-map-marker"></i>${currentUser.presentaddress} </small></h4>
					<hr>	
					<div class="row text-center">
						<div class="col-xs-4">
							<div><strong>${currentUser.followers}</strong></div>
							<div><small>Followers</small></div> 
						</div><!--/.col-->
						<div class="col-xs-4">
							<div><strong>${currentUser.following}</strong></div>
							<div><small>Following</small></div>
						</div><!--/.col-->
						<div class="col-xs-4">
							<div><strong>${currentUser.posts}</strong></div>
							<div><small>Posts</small></div>
						</div><!--/.col-->
					</div><!--/.row-->					
					<hr>
					<h4><strong>General Information</strong></h4>
					<ul class="profile-details">
						<li>
							<div><i class="fa fa-smile-o"></i> Sex</div>
							<input type="radio" name="sex" value="M" ${(currentUser.sex=='0')?'checked' : ''} disabled="disabled" />男&nbsp;&nbsp;&nbsp;
							<input type="radio" name="sex" value="W" ${(currentUser.sex=='1')?'checked' : ''} disabled="disabled"/>女
						</li>
						<li>
							<div><i class="fa fa-building-o"></i> Birthday</div>
							${currentUser.birthday}
						</li>
						<li>
							<div><i class="fa fa-square-o"></i> Marriage</div>
							<input type="radio" name="marriage" value="Y" ${(currentUser.marriage=='0')?'checked' : ''} disabled="disabled"/>是&nbsp;&nbsp;&nbsp;
							<input type="radio" name="marriage" value="N" ${(currentUser.marriage=='1')?'checked' : ''} disabled="disabled"/>否
						</li>
						<li>
							<div><i class="fa fa-file-o"></i> Profession</div>
							${currentUser.profession}
						</li>
					</ul>
					<hr>		
					<h4><strong>Contact Information</strong></h4>
					<ul class="profile-details">
						<li>
							<div><i class="fa fa-phone"></i> Phone</div>
							${currentUser.phone}
						</li>
						<li>
							<div><i class="fa fa-envelope"></i> E-mail</div>
							${currentUser.email}
						</li>
						<li>
							<div><i class="fa fa-map-marker"></i> Hometown</div>
							${currentUser.hometown}<br/>
						</li>
					</ul>					
				</div>				
			</div>	
		</div><!--/.col-->
		
		<div class="col-md-7">	
            <div class="panel panel-default" style="margin-left: -20px">
            	<div class="panel-heading">
                <h2><i class="fa fa-heart-o red"></i><strong>Update info</strong></h2>
              </div>
              <div class="panel-body">
                <form class="form-vertical hover-stripped" id="updateForm" method="post">
                  <div class="form-group">
                  		<input type="hidden" class="form-control" value="${currentUser.id}" name="id" id="userId">
                      <label class="control-label">Username</label>
                      <input type="text" class="form-control" value="${currentUser.loginname}" disabled name="loginname"> 
                  </div>
                  <div class="form-group">
                    <label class="control-label">Full name</label>
                    <input type="text" class="form-control" name="nickname" value="${currentUser.nickname}">
                  </div>
                  <div class="form-group">
                    <label class="control-label">Email</label>
                    <input type="email" class="form-control" name="email" value="${currentUser.email}">
                  </div>
                  <div class="form-group">
                    <label class="control-label">Front Web site</label>
                    <input type="email" class="form-control" name="front_url" value="${currentUser.front_url}">
                  </div>
									<div class="form-group">
                    <label class="control-label">New password</label>
                    <input type="password" id="pwd1" name="password" class="form-control">
                    <span id="info"></span>
                  </div>
                    <div class="form-group">
                      <label class="control-label">Repeat password</label>
                      <input type="password" id="pwd2" class="form-control" onblur="toValidate()">
                  </div>
                  <div class="form-group">
                      <label class="control-label">Experience</label>
											<textarea class="form-control" rows="3" name="experience">${currentUser.experience}</textarea>
									</div>
									<div class="form-group">
                    <label class="control-label">Introduce</label>
										<textarea class="form-control" rows="3" name="introduce">${currentUser.introduce}</textarea>
									</div>      
                  <div class="form-group pull-right">
                    <a type="submit" class="btn btn-primary" onclick="javaScript:$('#updateForm').submit();">Change</a>
                  </div> 
                </form>
              </div>
            </div>	
		</div><!--/.col-->
	
	</div><!--/.row profile-->				
</div>
<!-- end: Content -->

<script type="text/javascript">

	function toValidate(){
		var pwd1 = $("#pwd1");
		var pwd2 = $("#pwd2");
		if(pwd1.val()!=pwd2.val()){
			$("#info").html("<font color='red'>密码不一致，请重新输入</font>");
			pwd1.val('');
			pwd2.val('');
			pwd1.focus();
		}else{
			$("#info").html('');
		}
	}

	(function($){
		$(function(){
			$("#updateForm").submit(function(){
				$.post('${staticPath }/after/updateUserInfo.html',
					$("#updateForm").serialize(),
					function(data){
						if(data.success){
							$.alert("提示",data.msg,function(){
								window.location="${staticPath }/after/index.action";
							});
						}else{
							$.alert("提示",data.msg,function(){
								$.openHTML('${staticPath }/after/userInfo.html');
							});
						}
					},'json');
				return false;
			});
		});
	})(jQuery);

</script>