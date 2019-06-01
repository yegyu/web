/**
 * 회원관리 
 */
var iderror = "아이디를 입력하세요";
var passwderror = "비밀번호를 입력하세요";
var repasswderror = "비밀번호가 일치하지 않습니다.";
var nameerror = "이름을 입력하세요";
var juminerror = "주민번호를 확인하세요";
var telerror = "전화번호를 확인하세요";
var loginiderror = "입력하신 아이디가 없습니다.\n다시확인하세요";
var loginpasswderror = "입력하신 비밀번호가 다릅니다.\n다시확인 하세요";
var deleteerror = "회원 탈퇴에 실패했습니다. \n다시 시도하세요";
var deleteok = "회원탈퇴에 성공했습니다!!";
var modifyok = "수정 완료!!!";
var confirmerror = "아이디 중복확인을 해주세요";
var modifyerror = "회원 정보 수정 실패!!!";
var emailconfirmerror ="인증번호가 달라요!!!";
var emailconfirm = "인증 완료!!";
var emailerror = "이메일 형식이 맞지 않습니다.";	

//var c = 60;
//var t;
//setInterval(function(){
//	document.getElementById("txt").innerHTML= c;
//	c = c - 1;
//}, 1000);

///



///

function confirmemail(emailconfirm_value, authNum){
	
    // 입력한 값이 없거나, 인증코드가 일지하지 않을 경우
	if(!emailconfirm_value || emailconfirm_value != authNum){
		alert(emailconfirmerror);
		emailconfirm_value="";
		self.close();
    // 인증코드가 일치하는 경우
	}else if(emailconfirm_value==authNum){
		alert(emailconfirm);
		emailconfirm_value="";
		self.close();
		opener.document.insertform.emailconfirm_value.value=1;
	}
}

//이메일 체크
function emailcheck(email1, email2){
    // 유효성 검사
	if(inputform.email2.value !="0" || inputform.email1.value){
		
		var str = inputform.email1.value;
		var arr = str.split("@");
		//주소 직접입력일 경우
		if(inputform.email2.value == "0"){
			if(str.indexOf("@") == -1){
				alert("@을 써주세요");
				inputform.email1.focus();
				return false;
			}else if(str.indexOf("@") != str.lastIndexOf("@")){
				alert("@를 하나만 써주세요");
				inputform.email1.focus();
				return false;
			}else if(arr[0] == ""){
				alert("메일의 아이디가 빠졌어요");
				inputform.email1.focus();
				return false;
			}else if(arr[1] == ""){
				alert("주소를 써주세요!!");
				inputform.email1.focus();
				return false;
			}else if(arr[1].indexOf(".")==-1){
				alert("주소를 제대로 써주세요 콤마를 잊진 않으셨나요?");
				inputform.email1.focus();
				return false;
			}
		//주소를 선택할 경우
		}else{
			if(str.indexOf("@") != -1){
				alert("@를 빼주세요");
				inputform.email1.focus();
				return false;
			}else if(arr[0] == ""){
				alert("id를 써주세요");
				inputform.email1.focus();
				return false;
			}
		}
	}
    // 인증을 위해 새창으로 이동
	var url="emailAuth.jsp?email1="+email1+"&email2="+email2;
	open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no, width=500, height=400" );                           
}

var inputerror= "회원가입에 실패했습니다.\n잠시후 시도하세요";
function erroralert(msg){
	alert( msg );
	history.back();
}

//회원정보 수정
function modifycheck(){
	if(! modifyform.passwd.value){
		alert(passwderror);
		modifyform.passwd.focus();
		return false;
		
	}else if(modifyform.passwd.value != modifyform.repasswd.value){
		alert(repasswderror);
		modifyform.repasswd.focus();
		return false;
	}
}

//회원 탈퇴
function passwdcheck(){
	if(!passwdform.passwd.value){
		alert(passwderror);
		passwdform.passwd.focus();
		return false;
	}
}

//로그인
function logincheck(){
	if(!loginform.id.value){
		alert(iderror);
		loginform.id.focus();
		return false;
	}else if(! loginform.passwd.value){
		alert(passwderror);
		loginform.passwd.focus();
		return false;
	}
}

//주소 찾기 창
function openAdrWin(mod){
	var url = "searchAddressView.jsp?address=&mod=" + mod;
	open(url,  "_blank","statusbar = no , menubar=no, toolbar=no, scrollbar=no, width=500, height=400");
}
//주소확인
function searchAdr(mod){
	var url = 'searchAddressView.jsp?address=' + formsearch.adr.value +'&mod=' +mod;
	location = url;
	
}
//주소 선택
function selectAdr(zip,adr,mod){
	if(mod == 0){
		parent.window.opener.document.inputform.zipcode.value = zip ;
		parent.window.opener.document.inputform.address1.value = adr   ;
		parent.window.opener.document.inputform.address2.readOnly = false;
		self.close();
	}else if(mod==1){
		parent.window.opener.document.modifyform.zipcode.value = zip ;
		parent.window.opener.document.modifyform.address1.value = adr   ;
		parent.window.opener.document.modifyform.address2.readOnly = false;
		self.close();
		
	}
}


//아이디 중복확인
function confirmid(){
	if(!inputform.id.value){
		alert(iderror);
		inputform.id.focus();
	}else{
		var url = "confirmId.jsp?id="+inputform.id.value;
		open(url, "_blank","statusbar = no , menubar=no, toolbar=no, scrollbar=no, width=500, height=400");
	}
}

function confirmcheck(){
	if( ! confirmform.id.value){
		alert(iderror);
		confirmform.id.focus();
		return false;
	}
}
function setid(id){
	opener.document.inputform.confirm.value = "1";
	opener.document.inputform.id.value = id;
	self.close();
}

//메인페이지
function maincheck(){
	if(!mainform.id.value ){
		alert(iderror);
		mainform.id.focus();
		return false; //이벤트를 끊는 효과가 있다.
	} else if( ! mainform.passwd.value){
		alert( passwderror);
		mainform.passwd.focus();
		return false;
	}
	
}
//회원 가입
function inputcheck(){
	if(inputform.confirm.value=="0"){
		alert(confirmerror);
		inputform.id.focus();
//		inputform.confirm.value= "1";
		return false;
	}
	
	if(! inputform.id.value){
		alert(iderror);
		inputform.id.focus();
		return false;
	}else if( ! inputform.passwd.value ){
		alert(passwderror);
		inputform.passwd.focus();
		return false;
	}else if( inputform.passwd.value != inputform.repasswd.value){
		alert(repasswderror);
		inputform.repasswd.focus();
		return false;
	}else if(! inputform.name.value){
		alert(nameerror);
		inputform.name.focus();
		return false;
	}else if( inputform.jumin1.value.length < 6 || inputform.jumin2.value.length < 7){
		alert(juminerror);
		inputform.jumin1.focus();
		return false;
	}else if( inputform.tel1.value  || inputform.tel2.value || inputform.tel3.value){
		if(inputform.tel1.value.length < 3 || inputform.tel2.value.length <3 || inputform.tel2.value.length < 4 ){
			alert(telerror);
			inputform.tel1.focus();
			return false;
		}
	}
	if(inputform.email2.value !="0" || inputform.email1.value){
		
		var str = inputform.email1.value;
		var arr = str.split("@");
		//주소 직접입력일 경우
		if(inputform.email2.value == "0"){
			if(str.indexOf("@") == -1){
				alert("@을 써주세요");
				inputform.email1.focus();
				return false;
			}else if(str.indexOf("@") != str.lastIndexOf("@")){
				alert("@를 하나만 써주세요");
				inputform.email1.focus();
				return false;
			}else if(arr[0] == ""){
				alert("메일의 아이디가 빠졌어요");
				inputform.email1.focus();
				return false;
			}else if(arr[1] == ""){
				alert("주소를 써주세요!!");
				inputform.email1.focus();
				return false;
			}else if(arr[1].indexOf(".")==-1){
				alert("주소를 제대로 써주세요 콤마를 잊진 않으셨나요?");
				inputform.email1.focus();
				return false;
			}
		//주소를 선택할 경우
		}else{
			if(str.indexOf("@") != -1){
				alert("@를 빼주세요");
				inputform.email1.focus();
				return false;
			}else if(arr[0] == ""){
				alert("id를 써주세요");
				inputform.email1.focus();
				return false;
			}
		}
	}
		
		
	
	
	//1.null 인 경우   이동가능
	//2.직접입력일 경우 email1 란에 @가 없으면 경고
	//3.선택입력일 경우 email1 란에 @rk 있으면 경고
	//4.단 전화번호가 있건 없건 모두 가능해야 한다.
}
function nextjumin2(){
	if(inputform.jumin1.value.length  == 6){
		inputform.jumin2.focus();
	}
}
function nexttel1(){
	if(inputform.jumin2.value.length == 7){
		inputform.tel1.focus();
	}
}
function nexttel2(){
	if(inputform.tel1.value.length==3){
		inputform.tel2.focus();
	}
}
function nexttel3(){
	if(inputform.tel2.value.length==4){
		inputform.tel3.focus();
	}
}
function nextemail1(){
	if(inputform.tel3.value.length == 4){
		inputform.email1.focus();
	}
}














