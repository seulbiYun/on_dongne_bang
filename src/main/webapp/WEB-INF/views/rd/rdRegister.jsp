<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subHeader.jsp"%>
<section>
	<div id="htList">
		<table>
			<tr>
				<th>NO</th>
				<th>주소</th>
				<th>건물 타입</th>
				<th>층수</th>
				<th>엘레베이터</th>
				<th>주차장</th>
			</tr>
			<c:forEach var="ht" items="${htList }">
				<tr>
					<td>${ht.hNo }</td>
					<td>${ht.hAddress }</td>
					<td>${ht.hType }</td>
					<td>${ht.hFloor }</td>
					<c:if test="${ht.hElevator==0 }">
						<td>없음</td>
					</c:if>
					<c:if test="${ht.hElevator==1 }">
						<td>있음</td>
					</c:if>
					<c:if test="${ht.hParking==0 }">
						<td>없음</td>
					</c:if>
					<c:if test="${ht.hParking==1 }">
						<td>있음</td>
					</c:if>
				</tr>
			</c:forEach>	
		</table>
		<ul class = "pagination">
			<c:if test="${pageMaker.prev==true }">
				<li>
					<a href = "listPage?page=${pageMaker.startPage-1 }">&#8882;</a>
				</li>
			</c:if>
			<c:forEach begin = "${pageMaker.startPage }" end = "${pageMaker.endPage }" var = "idx">
				<li ${idx==pageMaker.cri.page ? 'class=active':'' }>
					<a href = "${pageContext.request.contextPath }/rd/rdRegister?page=${idx }">${idx }</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next==true }">
				<li>
					<a href = "listPage?page=${pageMaker.endPage+1 }">&#8883;</a>
				</li>
			</c:if>
		</ul>
	</div>
	<form action = "rdRegister" method = "post">
		<fieldset>
			<table id = "house">
				<tr>
					<th colspan="2" class = "title">매물 종류</th>
				</tr>
				<tr>
					<th class = "subTitle">건물 유형</th>
					<td class = "contents">
						<input type="text" readonly="readonly" value="${htVo.hType }">
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
						<input type="text" value="${htVo.hAdress }" readonly="readonly" name="house">					
						<p>
							<input type="text"><span>동</span>
						</p>
						<p>
							<input type="text"><span>호</span>
						</p>
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
					
					<th class="subTitle">반려동물</th>
					<td class="contents">
						<select name="rdPet">
							<option value="0">불가능</option>
							<option value="1">가능</option>
						</select>
					</td>
				</tr>
				<tr>
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
				<tr>
					<th class="subTitle">제목</th>
					<td class="contents">
						<input type = "text" name="">
					</td>
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
<%@ include file="../include/subFooter.jsp"%>