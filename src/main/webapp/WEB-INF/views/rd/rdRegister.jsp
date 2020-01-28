<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subHeader.jsp"%>
<style>
	fieldset{
		border:0.5px solid #d8d1cb;
		width: 70%;
		margin: 0 auto;
	}
	.submit{
		width: 10%;
		margin: 20px auto;
		text-align: center;
	}
	.submit input{
		border:0.5px solid #68745;
		padding: 8px;
		border-radius: 5px;
		background: #f0ad92; 
		color:white;
		font-weight: bold;
		margin-top: 10px;
		font-size: 16px;
	}
	fieldset table tr td{
		text-align: left;
	}
	fieldset button,fieldset input[type='button']{
		padding:3px;
		border: 0.5px solid #d8d1cb;
		background: white;
		border-radius: 3px;
		color:#68745c;
	}
	fieldset select{
		color:#68745c;
		padding:5px;
		outline: none;
		border-radius: 4px;
	}
	fieldset select option{
		display: block;
	}
	fieldset select option:checked{
		background: #ed9876;
		color:white;
		outline: none;
	}
	fieldset select option:focus,fieldset select option:hover{
		background: none;
		color:#68745c;
		font-weight: bold;
	} 
	
	#resultNone{
		height: 600px;
		padding-top:230px;
	}
	.contents input[type="button"]{
		border:0.5px solid #d8d1cb;
		background: #fff;
		color:#68745c;
		padding:3px;
		border-radius: 3px;
		outline:none;
		cursor: pointer;
		z-index: 1;
	}
	.contents input[type="button"].click{
		background: #f0ad92;
		color:#fff;
		z-index: 5;
	}
	
	.pMoney{
		outline: none;
		background: #f0ad92;
		color:#fff;
	}
	.pickItem{
		outline: none;
		background: #f0ad92;
		color:#fff;
	}
</style>
<section>
	<c:if test="${result != 0 }">
		<div id="htList">
			<%@ include file="../include/htListInclude.jsp" %>
		</div>
		<form action = "rdRegister" method = "post" enctype="multipart/form-data">
			<fieldset>
				<input type="hidden" value="${Auth }" name="mId">
				<input type = "hidden" value="" name = "hNo">
				<table id = "house">
					<tr>
						<th colspan="2" class = "title">매물 종류</th>
					</tr>
					<tr>
						<th class = "subTitle"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>건물 유형</th>
						<td class = "contents">
							<input type="text" readonly="readonly" name = "htType">
						</td>
					</tr>
					<tr>
						<th class = "subTitle"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>종류 선택</th>
						<td class = "contents">
							<select name = "rdType">
								<option value="0">--------------</option>
								<option value="1">원룸</option>
								<option value="2">투룸</option>
								<option value="3">쓰리룸</option>
								<option value="4">복층</option>
								<option value="5">1.5층 | 주방분리형</option>
							</select>
						</td>
					</tr>
				</table>
				<table id = "address">
					<tr>
						<th colspan="2" class = "title">위치정보</th>
					</tr>
					<tr>
						<th class = "subTitle">
							<span style="color:red;font-size:11px;margin-bottom:5px">*</span>주소
						</th>
						<td class="contents">
							<input type="text" readonly="readonly" name="house" style="margin-bottom:5px">					
							<p>
								<input type="text" style="margin-bottom:5px" name="house"> <span>동</span>
							</p>
							<p>
								<input type="text" style="margin-bottom:5px" name="house"> <span>호</span>
							</p>
						</td>
					</tr>
				</table>
				<table id = "contract">
					<tr>
						<th colspan="2" class = "title">계약 정보</th>
					</tr>
					<tr>
						<th rowspan="2" class = "subTitle" style="width:120px;"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>계약 종류</th>
						<td class="contents">
							<input type="radio" name="rdContract" id="wor" value="월세"> <label for="wor">월세</label>
							<input type="radio" name="rdContract" id="jeon" value="전세"> <label for="jeon">전세</label>
						</td>
					</tr>
					<tr>
						<td class="contents">
							<div id="tax"></div>
						</td>
					</tr>
				</table>
				<table id = "detail">
					<tr>
						<th colspan="4" class="title">기본 정보</th>
					</tr>
					<tr>
						<th rowspan="2" class="subTitle"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>면적</th>
						<td rowspan="2" class="contents">전용 면적 <input type = "text" name="rdArea"> ㎡</td>
						<th rowspan="2" class="subTitle"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>건물 층수</th>
					</tr>
					<tr>
						<td class="contents">
							해당 층수
							<select name = "rdFloor">
								<option value ="0">해당 층수 선택</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="subTitle"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>난방 종류</th>
						<td colspan="3" class="contents">
							<select name="rdHeating">
								<option value="0">난방 종류 선택</option>
								<option>중앙 난방</option>
								<option>개별 난방</option>
								<option>지역 난방</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="subTitle"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>입주 가능일</th>
						<td colspan="3" class="contents">
							<input type="button" id="now" name="rdAvailabledate" class="data" value="즉시 입주">
							<input type="button" id="tongue" name="rdAvailabledate" class="data" value="날짜 협의">
							<input type = "button" id="pickDate" value="날짜 선택">
							<input type="date" id="datapick" name="rdAvailabledate" style="display: none;">
						</td>
					</tr>
				</table>
				<table id = "option">
					<tr>
						<th colspan="6" class="title">추가 정보</th>
					</tr>
					<tr>
						<th rowspan="2" class="subTitle">관리비</th>
						<td colspan="4" class="contents">
							<input type = "text" name="rdAdcost" class="adcost"> 만원
						</td>
					</tr>
					<tr>
						<th class="subTitle" style="width:20%">
							관리비 항목
						</th>
						<td class="contents">
							<input type = "hidden" name="rdAdcostItem">
							<button type="button" name="Item">인터넷</button>
							<button type="button" name="Item">유선TV</button>
							<button type="button" name="Item">청소비</button>
							<button type="button" name="Item">수도세</button>
							<button type="button" name="Item">도시가스</button>
							<button type="button" name="Item">전기세</button>
						</td>
					</tr>
					<tr>
						
						<th class="subTitle">반려동물</th>
						<td colspan="2" class="contents">
							<select name="rdPet">
								<option value="0">불가능</option>
								<option value="1">가능</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="subTitle">베란다 | 발코니</th>
						<td colspan="2" class="contents">
							<select name="rdBalcony">
								<option value="0">불가능</option>
								<option value="1">가능</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="subTitle">옵션항목</th>
						<td colspan="2" class="contents">
							<input type="checkbox" name="rdCloset" id="1" value="0"> <label for="1">옷장</label>
							<input type="checkbox" name="rdShoecloset"id="2" value="0"> <label for="2">신발장</label>
							<input type="checkbox" name="rdAircon"id="3" value="0"> <label for="3">에어컨</label>
							<input type="checkbox" name="rdWasher"id="4" value="0"> <label for="4">세탁기</label>
							<input type="checkbox" name="rdInduction"id="5" value="0"> <label for="5">인덕션</label>
							<input type="checkbox" name="rdDoorlock"id="6" value="0"> <label for="6">도어락</label>
							<input type="checkbox" name="rdBed"id="7" value="0"> <label for="7">침대</label>
							<input type="checkbox" name="rdMicrowave"id="8" value="0"> <label for="8">전자레인지</label>
							<input type="checkbox" name="rdTv"id="9" value="0"> <label for="9">TV</label>
							<input type="checkbox" name="rdDesk"id="10" value="0"> <label for="10">책상</label>
							<input type="checkbox" name="rdRefrigerator"id="11" value="0"> <label for="11">냉장고</label>
						</td>
					</tr>
				</table>
				<table id = "textTable">
					<tr>
						<th class="subTitle"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>제목</th>
						<td class="contents">
							<input type = "text" name="rdTitle">
						</td>
					</tr>
					<tr>
						<th class="subTitle"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>상세설명</th>
						<td>
							<textarea rows="10" cols="80" name="rdContents"></textarea>
						</td> 
					</tr>
				</table>
				<table id = "imageTable">
					<tr>
						<th class="title"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>사진등록</th>
					</tr>
					<tr>
						<td>
							<input type="file" name="imgFiles" multiple="multiple">
						</td>
					</tr>
					<tr>	
						<td>
							<div id = "roomImg" style="min-height: 100px;text-align: center;">
								<span style="color:#aaa;font-size:12px;display:block;margin: 0 auto;line-height: 100px;">
									※최소 3장이상 등록해야합니다.※
								</span>
							</div>
						</td>
					</tr>
				</table>
				<p class="submit">
					<input type="submit" value="방 등록">
				</p>
			</fieldset>
		</form>
	</c:if>
	<c:if test="${result == 0}">
	<div id= "resultNone">
		<h1 style="color:#68745c;text-align:center;margin:20px 0;">건물 정보가 등록되어 있지 않습니다</h1>
		<span style="color:red;font-size:13px;display:block;width:350px;margin:20px auto;">(※건물 정보를 등록하셔야 방을 올릴 수 있습니다※)</span>
		<a href = "${pageContext.request.contextPath }/ht/htRegister"
			style="color:#fff;border:0.5px solid #d8d1cb;
			background:#f0ad92;display:block;width:130px;margin:20px auto;
			border-radius:5px;padding:5px;text-align:center;">
			건물 정보 등록</a>
	</div>
	</c:if>
</section>
<script>
	$(".htd").click(function(){
		$("tr").removeClass("pick");
		$(this).addClass("pick");
		
		var htType = $(this).find(".htType").html();
		var hAddress =$(this).find(".hAddress").html();
		var hNo = $(this).find(".hNo").html();
		
		$("input[name='htType']").val(htType);
		$("input[name='house']").eq(0).val(hAddress);
		$("input[name='hNo']").val(hNo);
		
		var StrHFloor = $(this).find(".hFloor").html();
		var str = StrHFloor.split('층');
		var SHFloor = str[0];
		var hFloor = Number(SHFloor);
		
		for(var i = 1; i <= hFloor; i++){
			var $option = $("<option>").attr("value",i+"층").text(i+"층");
			$("select[name='rdFloor']").append($option);
		}
		
	})
	
	$("#wor").click(function(){
		if($("#jeon").attr("class")=="pMoney"){
			$("#jeon").removeClass("pMoney");
		}
		$(this).toggleClass("pMoney");
		$("#tax").empty();
		if($(this).attr("class")=="pMoney"){
			var $input = $("<input>").attr("type","text").attr("placeholder","보증금").attr("name","rdDeposit");
			var $input2 = $("<input>").attr("type","text").attr("placeholder","월세").attr("name","rdMonthly");
			
			$("#tax").append($input).append(" 만원 / ").append($input2).append(" 만원");
			
		}else if($("input:radio[id='jeon']").is(":checked")){
			$(this).removeAttr("checked");
		}
		
	})
	
	$("#jeon").click(function(){
		if($("#wor").attr("class")=="pMoney"){
			$("#wor").removeClass("pMoney");
		}
		$(this).toggleClass("pMoney");
		$("#tax").empty();
		if($(this).attr("class")=="pMoney"){
			var $input = $("<input>").attr("type","text").attr("placeholder","보증금").attr("name","rdDeposit");
			
			$("#tax").append($input).append(" 만원");
		}else if($("input:radio[id='jeon']").is(":checked")){
			$(this).removeAttr("checked");
		}
	})
	
	$(".data").click(function(){
		$(".data").removeClass("click");
		$(this).addClass("click");
		$("#pickDate").css("display","inline"); //button
		$("#datapick").css("display","none"); //input
	})
	
	$("#pickDate").click(function(){
		$(".data").removeClass("click");
		$(this).css("display","none");
		$("#datapick").css("display","inline");
	})
	
	$("input[name='imgFiles']").change(function(){
		$("#roomImg").empty();
		
		//$(this) : jquery obj
         //$(this)[0] : javascript obj
         //File Read는 javascript만 가능
         for(var i=0; i<$(this)[0].files.length; i++){
            var file = $(this)[0].files[i];
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function(e) {
               var $img = $("<img>").attr("src", e.target.result).css("width","100px").css("height","100px");
               $("#roomImg").append($img).css("border","1px solid #d2d6de").css("margin-top","20px");
            }
         }
	})
	
	$("button[name='Item']").click(function(){
		$(this).toggleClass("pickItem");
		var item="";
		$(".pickItem").each(function(i, obj){
			
			if(i == $(".pickItem").length-1){
				item += $(obj).text();
			}else{
				item += $(obj).text()+",";
			}
		})
		$("input[name='rdAdcostItem']").val(item);
	})
	
	
	$("form").submit(function(){
		var rdType = $("select[name='rdType']").val();
		if(rdType=="0"){
			alert("방 종류를 선택해 주세요.");
			return false;			
		}
		
		var house1 = $("input[name='house']").eq(0).val();
		var house2 = $("input[name='house']").eq(1).val();
		var house3 = $("input[name='house']").eq(2).val();
		if(house1 == ""||house2 == "" || house3 == ""){
			alert("주소를 입력해주세요.");
			return false;
		}else{
			var house = house1 + house2 + house3;
			$("input[name='house']").eq(0).val(house);
		}
		
		var tax = $("#tax").html();
		if(tax == null){
			alert("계약 종류를 입력하세요");
			return false;
		}else if(tax != null){
			if($("#tax").find("input").val() == ""){
				alert("보증금 / 월세를 입력해주세요.");
				return false;
			}
		}
		
		var rdFloor = $("select[name='rdFloor']").val();
		if(rdFloor == "0"){
			alert("해당 층수를 선택해 주세요.");
			return false;
		}
		
		
		var rdHeating = $("select[name='rdHeating']").val();
		if(rdHeating=="0"){
			alert("난방 종류를 선택해 주세요");
			return false;
		}
		
		var check = $("input[type='checkbox']").is(":checked");
		if(check == true){
			$("input[type='checkbox']").is(":checked").val("1");
		}
		
		var rdTitle = $("input[name='rdTitle']").val();
		if(rdTitle == ""){
			alert("상세정보의 제목을 입력하세요");
			return false;
		}
		
		var rdContents = $("textarea[name='rdContents']").val();
		if(rdTitle == ""){
			alert("상세정보의 설명을 입력하세요");
			return false;
		}
		
		var files = $("input[name='files']").files;
		
		if(files.length < 3){
			alert("사진은 최소 3장 등록해야합니다.");
			return false;
		}
		
		
	})
</script>
<%@ include file="../include/subFooter.jsp"%>