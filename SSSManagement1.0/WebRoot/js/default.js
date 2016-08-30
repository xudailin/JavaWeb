// JavaScript Document
function check(){
    var checkAll_value = document.getElementsByName("checkAll");
	if(!$(checkAll_value).is(':checked')){
		uncheckAll();	
	}else{
		checkAll();
	}
}

function checkAll(){
		
	var checkbox_values = document.getElementsByName("ids"); 
	for(i = 0;i < checkbox_values.length;i++){ 
       if(checkbox_values[i].type == "checkbox") 
       { 
          checkbox_values[i].checked = true; 
       } 
    } 
}

function uncheckAll(){
   	var checkbox_values = document.getElementsByName("ids");
    for(i = 0;i < checkbox_values.length;i++){ 
        if(checkbox_values[i].type == "checkbox") 
        { 
            checkbox_values[i].checked = false; 
        } 
	}
}

function checkOldPwd(){
	if($("#oldPass").val() == ''){
		    $("#oldPassHint").html("<font color='red'>密码不能为空！</font>");
			$("#oldPass").focus();
	}else{
			$("#oldPassHint").html("<font color='green'>合法！</font>");
	}
}

function checkNewPwd(){
	if($("#newPass").val() == ''){
		    $("#newPassHint").html("<font color='red'>密码不能为空！</font>");
			$("#newPass").focus();
	}else{
			$("#newPassHint").html("<font color='green'>合法！</font>");
	}
}
function checkPwd(){
	if($("#confirmPass").val() == ''){
		    $("#confirmPassHint").html("<font color='red'>确认密码不能为空！</font>");
			$("#confirmPass").focus();
	}else{
		if ($("#newPass").val() != $("#confirmPass").val()){
			$("#confirmPassHint").html("<font color='red'>两次密码输入不一致！</font>");
		    $("#confirmPass").focus();
		}else{
			$("#confirmPassHint").html("<font color='green'>确认成功！</font>");
		}
	}
}

function getPlaceItems(){
	var place = document.getElementById("placeId");
	var url = "provider!getPlaceItems.action";
	$.get(url,function(data){
		$.each(data, function (n, value) { 
				place.options.add(new Option(value.placeName,value.placeName));
	         });
	},'json');
}
	
function getBankItems(){
		var bank = document.getElementById("bankId"); 
		var url = "provider!getBankItems.action";
		$.get(url,function(data){
			$.each(data, function (n, value) { 
					bank.options.add(new Option(value.bankName,value.bankName));         
		         });
		},'json');
	}
function init(){
	getPlaceItems();
	getBankItems();
}

function initProvince(){
	getPlaceItems();
}

function initManager(){
	var manager = document.getElementById("managerId"); 
		var url = "product!getManagerItems.action";
		$.get(url,function(data){
			$.each(data, function (n, value) { 
				manager.options.add(new Option(value.managerName,value.managerName));         
		         });
		},'json');
}

function initProvider(){
	var provider = document.getElementById("providerId"); 
	var url = "product!getProviderItems.action";
	$.get(url,function(data){
		$.each(data, function (n, value) { 
			provider.options.add(new Option(value.providerName,value.providerName));         
	         });
	},'json');	
}

function goInPre(){
	var startTime = $("#startTime").val(); 
	var endTime = $("#endTime").val();
	var page = $("#page1").val(); 
	var url = "inOrder!queryInOrder.action?page="+page+"&startTime="+startTime+"&endTime="+endTime;
 	window.location=url;
}
function goInNext(){
	var startTime = $("#startTime").val(); 
	var endTime = $("#endTime").val();
	var page = $("#page2").val();
	var url = "inOrder!queryInOrder.action?page="+page+"&startTime="+startTime+"&endTime="+endTime;
 	window.location=url;
}

function goOutPre(){
	var startTime = $("#startTime").val(); 
	var endTime = $("#endTime").val(); 
	var page = $("#page1").val();
	var url = "outOrder!queryOutOrder.action?page="+page+"&startTime="+startTime+"&endTime="+endTime;
 	window.location=url;
}
function goOutNext(){
	var startTime = $("#startTime").val(); 
	var endTime = $("#endTime").val(); 
	var page = $("#page2").val();
	var url = "outOrder!queryOutOrder.action?page="+page+"&startTime="+startTime+"&endTime="+endTime;
 	window.location=url;
}

function senfe(o,a,b,c,d){
	var t=document.getElementById(o).getElementsByTagName("tr");
	for(var i=0;i<t.length;i++){
		t[i].style.backgroundColor=(t[i].sectionRowIndex%2==0)?a:b;
		t[i].onclick=function(){
			if(this.x!="1"){
				this.x="1";
				this.style.backgroundColor=d;
			}else{
				this.x="0";
				this.style.backgroundColor=(this.sectionRowIndex%2==0)?a:b;
			}
		}
		t[i].onmouseover=function(){
			if(this.x!="1")this.style.backgroundColor=c;
		}
		t[i].onmouseout=function(){
			if(this.x!="1")this.style.backgroundColor=(this.sectionRowIndex%2==0)?a:b;
		}
	}
}

function delOutAll(){
    form2.action="outOrder!delete.action?flag=1";
    form2.submit();
}

function delInAll(){
    form3.action="inOrder!delete.action?flag=1";
    form3.submit();

}

function delProdAll() {
	form3.action = "product!delete.action";
	form3.submit();

}

function delProvAll(){
	   form1.action="provider!delete.action?flag=1";
	    form1.submit();
	}

function go(url){
	window.location=url;
	}