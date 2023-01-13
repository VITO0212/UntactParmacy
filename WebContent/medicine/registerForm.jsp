<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko-kr">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>약 제품 추가 - 약 정보 입력</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 	<script>
function medCreate() {
	if (form.med_id.value == "") {
		alert("약품 ID를 입력하십시오.");
		form.med_id.focus();
		return false;
	} 
	if (form.med_name.value == "") {
		alert("약품 이름을 입력하십시오.");
		form.med_name.focus();
		return false;
	}
	if (form.symptom.value == "") {
		alert("관련 증상을 입력하십시오.");
		form.symptom.focus();
		return false;
	}
	if(form.co_name.value == "") {
		alert("제약회사명을 입력하십시오.");
		form.co_name.focus();
		return false;
	}
	if(form.med_category.value == "") {
		alert("약품 카테고리를 선택하십시오.");
		form.med_category.focus();
		return false;
	}
	var priceExp = /^\d{1,5}$/;
	if(priceExp.test(form.price.value)==false) {
		alert("가격을 올바르게 입력하십시오.");
		form.price.focus();
		return false;
	}
	if(form.quantity.value == "") {
		alert("수량을 입력하십시오.");
		form.quantity.focus();
		return false;
	}
	form.submit();
}
	</script>
</head>
<body>
<%@include file="/admin/navbar.jsp" %>
<div class="container">  
	<br>
	<h4>약 정보 입력</h4>
	<br>
	<!-- 제품 등록을 실패했을 경우 exception 객체에 저장된 오류 메시지를 출력 -->
	<div class="row col-lg-12">
		<c:if test="${registerFailed}">
			<h6 class="text-danger"><c:out value="${exception.getMessage()}"/></h6>
		</c:if>
	</div>	
	  
	<!-- registration form  -->
	<form name="form" method="POST" action="<c:url value='/medicine/register' />" enctype="multipart/form-data" >
		<div class="form-group row">   
	        <label for="med_id" class="col-lg-2 col-form-label">약품 ID</label>
	        <div class="col-lg-10">
	            <input type="text" name="med_id" class="form-control" placeholder="약품 ID"> 
	        </div>
	    </div>       
	    <div class="form-group row">   
	        <label for="med_name" class="col-lg-2 col-form-label">약품 이름</label>
	        <div class="col-lg-10">
	            <input type="text" name="med_name" class="form-control" placeholder="약품 이름"> 
	        </div>
	    </div>       
		<div class="form-group row">   
	        <label for="symptom" class="col-lg-2 col-form-label">관련 증상(효능,효과)</label>
	        <div class="col-lg-10">
	        	<input type="text" name="symptom" class="form-control" placeholder="예: 당뇨병"
	        		<c:if test="${registerFailed}"> value="${medicine.symptom}"</c:if> > 
	        </div>
	    </div>       
	    <div class="form-group row">  
	        <label for="co_name" class="col-lg-2 col-form-label">제약회사명</label>
	        <div class="col-lg-10">
	        	<input type="text" name="co_name" class="form-control" placeholder="제약회사 이름"
	        		<c:if test="${registerFailed}">value="${medicine.co_name}"</c:if> >  
	        </div>
	    </div> 
		<div class="form-group row">  
	        <label for="med_category" class="col-lg-2 col-form-label">약품 카테고리</label>
	        <div class="col-lg-10">
	        	<select id="categorySelect" name="med_category" class="form-control"> 
					<option value="감염성 질환 약">감염성 질환 약</option>
						<option value="고혈압, 혈관 약">고혈압, 혈관 약</option>
							<option value="근골격계 질환 약">근골격계 질환 약</option>
								<option value="알러지 질환 약">알러지 질환 약</option>
									<option value="호르몬, 대사관련 질환 약">호르몬, 대사관련 질환 약</option>
										<option value="진통제">진통제</option>
											<option value="암 및 면역관련 질환 약">암 및 면역관련 질환 약</option>
												<option value="피부관련 질환 약">피부관련 질환 약</option>
													<option value="비타민 및 영양제류">비타민 및 영양제류</option>
													<option value="눈, 귀, 구강용 약물">눈, 귀, 구강용 약물</option>
													<option value="신경계 질환, 정신/행동장애 약물">신경계 질환, 정신/행동장애 약물</option>
														<option value="기타 약물">기타 약물</option>
														</select>
	        </div>
	    </div> 
	    <div class="form-group row">  
	        <label for="price" class="col-lg-2 col-form-label">약품 가격</label>
	        <div class="col-lg-10">
	        	<input type="text" name="price" class="form-control" placeholder="가격(원)"
	        		<c:if test="${registerFailed}">value="${medicine.price}"</c:if> >  
	        </div>
	    </div> 
	    <div class="form-group row">  
	        <label for="quantity" class="col-lg-2 col-form-label">약품 수량</label>
	        <div class="col-lg-10">
	        	<input type="text" name="quantity" class="form-control" placeholder="수량"
	        		<c:if test="${registerFailed}">value="${medicine.quantity}"</c:if> >  
	        </div>
	    </div>
	    <div class="form-group row">  
	        <label for="picture" class="col-lg-2 col-form-label">약품 이미지 업로드</label>
	        <div class="col-lg-10">
	        	<input type="file" name="picture" class="form-control"> 
	        </div>
	    </div>  
   		<br>
		<div class="form-group">        
			<input type="button" class="btn btn-outline-info" value="등록" onClick="medCreate()"> 
			<a href="<c:url value='/medicine/list' />" class="btn btn-outline-secondary">약 목록 </a>    		     
		</div>   
	</form> 
</div>
</body>
</html>