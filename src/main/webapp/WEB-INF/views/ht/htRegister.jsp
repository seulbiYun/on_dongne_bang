<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subHeader.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7904280938241876642348cdc418d37c&libraries=services"></script>
<style>
	section h1{
		color:#68745c;
		text-align: center;
		margin-top: 50px;
	}
	table{
		width: 800px;
		margin: 50px auto 0;
		
	}
	table, th, td{
		border:1px solid #d8d1cb;
		border-collapse: collapse;
	}
	th,td{
		padding:10px;
		color:#68745c;
	}
	td{
		text-align: center;
		font-size: 14px;
	}
	td a{
		color:#68745c;
	}
	td a:hover{
		font-weight: bold;
	}
	fieldset{
		border:0.5px solid #d8d1cb;
		width: 70%;
		margin: 50px auto 80px;
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
		border: 1px solid #d8d1cb;
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
</style>	
<section>
	<h1>${Auth }님 방 올리기</h1>
	<form action="htRegister" method = "post">
		<fieldset>
			<input type = "hidden" value="${Auth }" name = "member">
			<table id = "house">
				<tr>  
					<th colspan="2" class = "title">매물 종류</th>
				</tr>
				<tr>
					<th class = "subTitle"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>건물 유형</th>
					<td class = "contents">
						<select name = "hType">
							<option value="0">건물 타입</option>
							<option value="단독주택">단독주택</option>
							<option value="다가구주택">다가구주택</option>
							<option value="상가주택">상가주택</option>
							<option value="빌라">빌라</option>
							<option value="오피스텔">오피스텔</option>
							<option value="아파트">아파트</option>
						</select>
					</td>
				</tr>
			</table>
			<table id = "htDetail">
				<tr>
					<th><span style="color:red;font-size:11px;margin-bottom:5px">*</span>건물 층수</th>
				</tr>
				<tr>
					<td class ="contents" style="text-align:center;">
						<select name="hFloor">
							<option value="0">건물 전체 층수</option>
							<c:forEach var="i" begin="1" end="50">
								<option value="${i }층">${i }층</option>
							</c:forEach>     
						</select>
					</td>
				</tr>
			</table>
			<table id = "address">
				<tr>
					<th colspan="2" class = "title">위치정보</th>
				</tr>
				<tr>
					<th class = "subTitle"><span style="color:red;font-size:11px;margin-bottom:5px">*</span>주소
					</th>
					<td class="contents">
						<input type="text" id="sample5_address" placeholder="주소" name="hAddress" readonly="readonly">
						<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
						<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
					</td>
				</tr>
			</table>
			<table id = "htOption">
				<tr>
					<th class="subTitle">엘레베이터</th>
					<td class="contents">
						<select name="hElevator">
							<option value="0">불가능</option>
							<option value="1">가능</option>
						</select>
					</td>
					<th class="subTitle">주차여부</th>
					<td class="contents">
						<select name="hParking">
							<option value="0">불가능</option>
							<option value="1">가능</option>
						</select>
					</td>
				</tr>
			</table>
			<p class="submit">
				<input type = "submit" value="방 정보 입력하기">
			</p>
		</fieldset>
	</form>
</section>

<script>
	var themeObj = {
			bgColor: "#FFFFFF", //바탕 배경색
			searchBgColor: "#F0AD92", //검색창 배경색
			contentBgColor: "#FFFFFF", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
			pageBgColor: "#FFFFFF", //페이지 배경색
			textColor: "#68745C", //기본 글자색
			queryTextColor: "#FFFFFF", //검색창 글자색
			postcodeTextColor: "#ED9867", //우편번호 글자색
			//emphTextColor: "", //강조 글자색
			outlineColor: "#D8D1CB" //테두리
		};
	
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
			        position: new daum.maps.LatLng(37.537187, 127.005476),
			        map: map
			    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                	console.log(data.address);
                	console.log(results);
                	console.log(status);
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                         // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            },
            theme: themeObj
        
        }).open();
    }
    
    $("form").submit(function(){
    	var hType = $("select[name='hType']").val();
    	var hAddress = $("input[name='hAddress']").val();
    	var hFoolr = $("select[name='hFloor']").val();
    	if(hType == "0"){
    		alert("건물 타입을 선택해주세요");
    		return false;
    	}
    	
    	if(hFoolr == "0"){
    		alert("건물 층수를 선택해주세요");
    		return false;
    	}
    	
    	if(hAddress == ""){
    		alert("주소를 입력해주세요");
    		return false;
    	}
    	
    })
</script>
<%@ include file="../include/subFooter.jsp"%>