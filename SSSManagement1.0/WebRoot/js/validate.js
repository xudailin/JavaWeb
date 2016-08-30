// JavaScript Document

var xmlRequest; // 定义为全局的
function validateAdminName() {
	if ($("#adminName").val() == '') {
		$("#adminNameHint").html("<font color='red'>用户名不能为空！</font>");
		$("#adminName").focus();
	} else {
		if ($("#adminName").val().length < 3) {
			$("#adminNameHint").html("<font color='red'>用户名长度不能小于3！</font>");
			$("#adminName").focus();
		} else {
			$("#adminNameHint").html("");
			checkAdmin();
		}
	}
}


function checkAdmin() {
	var url = "admin!checkAdminByName.action";
	$.get(url, {'adminName':$("#adminName").val()},function(data) {
		$("#adminNameHint").html(data.msg);
		$("#adminNameHint").css("color","red");
	}, 'json');
}

function validateTrueName() {
	// 表示2-4个汉字
	if (!$("#trueName").val().match(/[\u4E00-\u9FA5]{2,4}/)) {
		$("#TrueHint").html("<font color='red'>请填写真实姓名！</font>");
		$("#trueName").focus();
	} else {
		$("#TrueHint").html("<font color='green'>合法！</font>");
		$("#password").focus();
	}
}

function validatePassword() {
	// 表示6-10个单词字符，包括下划线，大写A-Z，小写a-z以及数字0-9
	if (!$("#password").val().match(/\w{6,10}/)) {
		$("#passwordHint").html("<font color='red'>密码格式不合法！</font>");
		$("#password").focus();
	} else {
		$("#passwordHint").html("<font color='green'>合法！</font>");
		$("#password1").focus();
	}
}

function validatePassword1() {
	if ($("#password").val() != $("#password1").val()) {
		$("#password1Hint").html("<font color='red'>两次密码输入不一致！</font>");
		$("#password1").focus();
	} else {
		if ($("#password1").val() == '') {
			$("#password1Hint").html("<font color='red'>确认密码不能为空！</font>");
			$("#password1").focus();
		} else {
			$("#password1Hint").html("<font color='green'>确认成功！</font>");
		}
	}
}

function validateEmail() {
	// 邮箱的格式
	if (!$("#email")
			.val()
			.match(
					/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)) {
		$("#EmailHint").html("<font color='red'>邮件格式不合法！</font>");
		$("#email").focus();
	} else {
		$("#EmailHint").html("<font color='green'>合法！</font>");
		$("#birth").focus();
	}
}

function validateMobile() {
	// 以13、15或18开头的号码
	if (!$("#mobile").val().match(/(13|15|18)\d{9}/)) {
		$("#MobileHint").html("<font color='red'>手机格式不合法！</font>");
		$("#mobile").focus();
	} else {
		$("#MobileHint").html("<font color='green'>合法！</font>");
		$("#QQ").focus();
	}
}

function validateQQ() {
	// 8-9个数字
	if (!$("#QQ").val().match(/\d{8,10}/)) {
		$("#qqHint").html("<font color='red'>QQ号格式不合法！</font>");
		$("#QQ").focus();
	} else {
		$("#qqHint").html("<font color='green'>合法！</font>");
		$("#email").focus();
	}
}

function validateGender() {
	var $genders = $("#gender").val();
	var flag=false;
	for(var i=0;i<$genders.length;i++){
			if($genders[i].checked){
				flag=true;
				break;
			}
	}
	if (!flag){
		$("#genderHint").html("<font color='red'>请选择性别！</font>");
	}else {
		$("#genderHint").html("<font color='green'>合法！</font>");
		$("#mobile").focus();
	}
}

function validateBirth() {
	// 例如1993-04-24
	if (!$("#birth").val().match(/\d{4}-\d{2}-\d{2}/)) {
		$("#BirthHint").html("<font color='red'>日期格式不对！</font>");
		$("#birth").focus();
	} else {
		$("#BirthHint").html("<font color='green'>合法！</font>");
		$("#birth").focus();
	}
}

function formSubmit(url) {
	if ($("#adminName").val() == ''
			|| $("#adminNameHint").css('color') == "red") {
		$("#trueName").focus();
	} else if ($("#trueName").val() == ''
			|| $("#TrueHint").css('color') == "red") {
		$("#password").focus();
	} else if ($("#password").val() == ''
			|| $("#passwordHint").css('color') == "red") {
		$("#password1").focus();
	} else if ($("#password1").val() == ''
			|| $("#password1Hint").css('color') == "red") {
		validatePassword1();
	} else if ($("#genderHint").css('color') == "red") {
		$("#mobile").focus();
	} else if ($("#mobile").val() == ''
			|| $("#MobileHint").css('color') == "red") {
		$("#QQ").focus();
	} else if ($("#QQ").val() == '' || $("#qqHint").css('color') == "red") {
		$("#password").focus();
	} else if ($("#email").val() == '' || $("#EmailHint").css('color') == "red") {
		$("#birth").focus();
	} else if ($("#birth").val() == '' || $("#BirthHint").css('color') == "red") {
		validateBirth();
	} else {
		document.myForm.action = url;
		document.myForm.submit();
	}
}

function Reset() {
	$("#adminNameHint").innerHTML = "";
	$("#TrueHint").innerHTML = "";
	$("#passwordHint").innerHTML = "";
	$("#password1Hint").innerHTML = "";
	$("#genderHint").innerHTML = "";
	$("#MobileHint").innerHTML = "";
	$("#qqHint").innerHTML = "";
	$("#EmailHint").innerHTML = "";
	$("#BirthHint").innerHTML = "";
	$("#adminName").focus();
}

function validateProviderId(){
	if($("#providerId").val() == ''){
		$("#IDhint").html("<font color='red'>ID不能为空！</font>");
		$("#providerId").focus();
	}else{
		var url = "provider!checkProviderId.action";
		$.get(url,{'providerId':encodeURI($("#providerId").val())},function(data) {
			$("#IDhint").html(data.msg);
			var ctx = data.msg;
			if(ctx.indexOf("合法")>0){
				$("#IDhint").css("color","green");
			}else{
				$("#IDhint").css("color","red");
			}
		},'json');
	}
	
}

function validateProviderName(){
	if($("#providerName").val() == ''){
		$("#providerNameHint").html("<font color='red'>供应商不能为空！</font>");
		$("#providerName").focus();
	}else{
		var url = "provider!checkProviderName.action";
		$.get(url, {'providerName':encodeURI($("#providerName").val())},function(data) {
			$("#providerNameHint").html(data.msg);
			var ctx = data.msg;
			if(ctx.indexOf("合法")>0){
				$("#providerNameHint").css("color","green");
			}else{
				$("#providerNameHint").css("color","red");
			}
		},'json');
	}
}


function validateProviderPlace(){
	if($("#placeId").val() == "-1"){
		$("#placeHint").html("<font color='red'>请选择地区！</font>")
	}else{
		$("#placeHint").html("<font color='green'>合法！</font>");
	}
}

function validateProviderPhone(){
	if (!$("#phone").val().match(/(13|15|18)\d{9}/)) {
		$("#phoneHint").html("<font color='red'>手机格式不合法！</font>");
		$("#phone").focus();
	} else {
		$("#phoneHint").html("<font color='green'>合法！</font>");
		$("#email").focus();
	}
}

function validateProviderEmail(){
	// 邮箱的格式
	if (!$("#email").val().match(
					/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)) {
		$("#emailHint").html("<font color='red'>邮件格式不合法！</font>");
		$("#email").focus();
	} else {
		$("#emailHint").html("<font color='green'>合法！</font>");
	}
}

function validateProviderBank(){
	if($("#bankId").val() == "-1"){
		$("#bankHint").html("<font color='red'>请选择银行！</font>")
	}else{
		$("#bankHint").html("<font color='green'>合法！</font>");
	}
}

function validateProductId(){
	if($("#productId").val() == ''){
		$("#IDhint").html("<font color='red'>ID不能为空！</font>");
		$("#productId").focus();
	}else{
		var url = "product!checkProductId.action";
		$.get(url,{'productId':encodeURI($("#productId").val())},function(data) {
			$("#IDhint").html(data.msg);
			var ctx = data.msg;
			if(ctx.indexOf("合法")>0){
				$("#IDhint").css("color","green");
			}else{
				$("#IDhint").css("color","red");
			}
		},'json');
	}
}
function validateProductName(){
	if($("#productName").val() == ''){
		$("#productNameHint").html("<font color='red'>商品全称不能为空！</font>");
		$("#productName").focus();
	}else{
		var url = "product!checkProductName.action";
		$.get(url, {'productName':encodeURI($("#productName").val())},function(data) {
			$("#productNameHint").html(data.msg);
			var ctx = data.msg;
			if(ctx.indexOf("合法")>0){
				$("#productNameHint").css("color","green");
			}else{
				$("#productNameHint").css("color","red");
			}
		},'json');
	}
	
}
function validateShortName(){
	if ($("#shortName").val() == '') {
		$("#shortNameHint").html("<font color='red'>简称不能为空！</font>");
		$("#shortName").focus();
	} else {
		$("#shortNameHint").html("<font color='red'>合法！</font>");
		$("#productBatch").focus();
	}
}
function validateProductBatch(){
	if ($("#productBatch").val() == '') {
		$("#productBatchHint").html("<font color='red'>批次不能为空！</font>");
		$("#productBatch").focus();
	} else {
		$("#productBatchHint").html("<font color='red'>合法！</font>");
		$("#productUnit").focus();
	}
}
function validateProductUnit(){
	if ($("#productUnit").val() == '') {
		$("#productUnitHint").html("<font color='red'>单位不能为空！</font>");
		$("#productUnit").focus();
	} else {
		$("#productUnitHint").html("<font color='red'>合法！</font>");
		$("#productPrice").focus();
	}
}
function validateProductPrice(){
	if ($("#productPrice").val() == '') {
		$("#productPriceHint").html("<font color='red'>单价不能为空！</font>");
		$("#productPrice").focus();
	} else {
		$("#productPriceHint").html("<font color='red'>合法！</font>");
	}
}
function validateProvider(){
	if($("#providerId").val() == "-1"){
		$("#providerHint").html("<font color='red'>请选择供应商！</font>")
	}else{
		$("#providerHint").html("<font color='green'>合法！</font>");
	}
}