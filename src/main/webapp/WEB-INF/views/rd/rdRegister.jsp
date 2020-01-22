<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subHeader.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7904280938241876642348cdc418d37c&libraries=services"></script>
<section>
	<h1>${Auth }님 방 올리기</h1>
	<form action = "rdRegister" method = "post">
		<fieldset>
			<table id = "house">
				<tr>
					<th colspan="2" class = "title">매물 종류</th>
				</tr>
				<tr>
					<th class = "subTitle">건물 유형</th>
					<td class = "contents">
						<select name = "house">
							<option value="단독주택">단독주택</option>
							<option value="다가구주택">다가구주택</option>
							<option value="상가주택">상가주택</option>
							<option value="빌라">빌라</option>
							<option value="오피스텔">오피스텔</option>
							<option value="아파트">아파트</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class = "subTitle">종류 선택</th>
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
						주소
					</th>
					<td class="contents">
						<input type="text" id="sample5_address" placeholder="주소" name="house">
						<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
						<textarea rows="5" cols="70"></textarea>
						<p>
							<input type="text"><span>동</span>
						</p>
						<p>
							<input type="text"><span>호</span>
						</p>
						<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
					</td>
				</tr>
			</table>
			<table id = "contract">
				<tr>
					<th colspan="2" class = "title">계약 정보</th>
				</tr>
				<tr>
					<th rowspan="2" class = "subTitle">계약 종류</th>
					<td class="contents">
						<button type="button" name="rdContract">월세</button>
						<button type="button" name="rdContract">전세</button>
					</td>
				</tr>
				<tr>
					<td class="contents">
						
					</td>
				</tr>
			</table>
			<table id = "detail">
				<tr>
					<th colspan="4" class="title">기본 정보</th>
				</tr>
				<tr>
					<th rowspan="2" class="subTitle">면적</th>
					<td rowspan="2" class="contents">전용 면적 <input type = "text"> ㎡</td>
					<th rowspan="2" class="subTitle">건물 층수</th>
					<td class ="contents">
						건물 층수
						<select>
							<option>건물 전체 층수</option>     
						</select>
					</td>
				</tr>
				<tr>
					<td class="contents">
						해당 층수
						<select>
							<option>해당 층수 선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="subTitle">난방 종류</th>
					<td class="contents">
						<select name="rdHeating">
							<option>난방 종류 선택</option>
							<option>중앙 난방</option>
							<option>개별 난방</option>
							<option>지역 난방</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="subTitle">입주 가능일</th>
					<td class="contents">
						<button type="button" id="now">즉시 입주</button>
						<button type="button" id="tongue">날짜 협의</button>
						<button type="button" id="datapick">날짜 선택</button>
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
						<input type = "text" name="rdAdcost"> 만원 <input type="radio" value="0" name="rdAdcost"> 관리비 없음
					</td>
				</tr>
				<tr>
					<th class="subTitle">
						관리비 항목
					</th>
					<td colspan="3" class="contents">
						<button type="button" name="rdAdcostItem">인터넷</button>
						<button type="button" name="rdAdcostItem">유선TV</button>
						<button type="button" name="rdAdcostItem">청소비</button>
						<button type="button" name="rdAdcostItem">수도세</button>
						<button type="button" name="rdAdcostItem">도시가스</button>
						<button type="button" name="rdAdcostItem">전기세</button>
					</td>
				</tr>
				<tr>
					<th class="subTitle">주차여부</th>
					<td class="contents">
						<select name="hParking">
							<option value="0">불가능</option>
							<option value="1">가능</option>
						</select>
					</td>
					<th class="subTitle">반려동물</th>
					<td class="contents">
						<select name="rdPet">
							<option value="0">불가능</option>
							<option value="1">가능</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="subTitle">엘레베이터</th>
					<td class="contents">
						<select name="hElevator">
							<option value="0">불가능</option>
							<option value="1">가능</option>
						</select>
					</td>
					<th class="subTitle">베란다 | 발코니</th>
					<td class="contents">
						<select name="rdBalcony">
							<option value="0">불가능</option>
							<option value="1">가능</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="subTitle">옵션항목</th>
					<td class="contents">
						<input type="checkbox" name="rdCloset"> 옷장
						<input type="checkbox" name="rdShoecloset"> 신발장
						<input type="checkbox" name="rdAircon"> 에어컨
						<input type="checkbox" name="rdWasher"> 세탁기
						<input type="checkbox" name="rdInduction"> 인덕션
						<input type="checkbox" name="rdDoorlock"> 도어락
						<input type="checkbox" name="rdBed"> 침대
						<input type="checkbox" name="rdMicrowave"> 전자레인지
						<input type="checkbox" name="rdTv"> TV
						<input type="checkbox" name="rdDesk"> 책상
						<input type="checkbox" name="rdRefrigerator"> 냉장고
					</td>
				</tr>
			</table>
			<table id = "textTable">
				<tr>
					<th class="title">상세설명</th>
				</tr>
			</table>
			<table id = "imageTable">
				<tr>
					<th class="title">사진등록</th>
				</tr>
				<tr>
					<td>
						<div>
						
						</div>
					</td>
				</tr>
			</table>
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
</script>
<%@ include file="../include/subFooter.jsp"%>