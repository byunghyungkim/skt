<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>SKT VoLTE Monitoring!</title>
	<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/common.css'/>" />
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript">

	function select_item_du(duno) {
		alert("미구현 : " + duno);

		//각 상세정보 초기화
		//$('.dataDuid').empty();
	}

	function select_item_region(regno) {
		$.post("<c:url value='/dashboard/getdu'/>", {REG_NO: regno}, function(data)
		{
			//initialize du list
			$('.dataDuid').empty();

			//선택된 지역  class = on 으로 변경

			if( data.length > 0 ) {
				for(var idx in data)
				{
					/*
					if(idx == 0) { //check first item
						$('.dataDuid').append("<li><a href=\"#\" class=\"on\" onclick=\"select_item_du("+ data[idx].DU_NO +");\">" + data[idx].DU_NAME + "</a></li>")
					}
					else {
						$('.dataDuid').append("<li><a href=\"#\" onclick=\"select_item_du("+ data[idx].DU_NO +");\">" + data[idx].DU_NAME + "</a></li>")
					}
					*/

					//no selected at first
					$('.dataDuid').append("<li><a href=\"#\" onclick=\"select_item_du("+ data[idx].DU_NO +");\">" + data[idx].DU_NAME + "</a></li>")
				}
			}
			else {
				alert("No du in the region");
			}


		}, "json").fail(function() { alert("Internal Server Error - region"); });
	}

	$(function(){
		$.post("<c:url value='/dashboard/getregion'/>", function(data)
		{
			for(var idx in data)
			{
				/*
				if(idx == 0) { //check first item
					$('.dataArea').append("<li><a href=\"#\" class=\"on\" onclick=\"select_item_region("+ data[idx].REG_NO +");\">" + data[idx].REG_NAME + "</a></li>")
				}
				else {
					$('.dataArea').append("<li><a href=\"#\" onclick=\"select_item_region("+ data[idx].REG_NO +");\">" + data[idx].REG_NAME + "</a></li>")
				}
				*/
				//no selected at first
				$('.dataArea').append("<li><a href=\"#\" onclick=\"select_item_region("+ data[idx].REG_NO +");\">" + data[idx].REG_NAME + "</a></li>")
			}
		}, "json").fail(function() { alert("Internal Server Error!"); });

	});

	// ----------- Event -------------
	//emphasize on click item
	//region area event
	$(function(){
		$("body").delegate(".dataArea li a", "click", function() {
			$(".dataArea li a").removeClass("on");
			$(this).addClass("on");
		});
	});

	//du area event
	$(function(){
		$("body").delegate(".dataDuid li a", "click", function() {
			$(".dataDuid li a").removeClass("on");
			$(this).addClass("on");
		});
	});

	// change tab event
	$(function(){
		$(".table_tab li a").bind("click",function(e){
			e.preventDefault();
			$(".table_tab li").removeClass("on");
			$(".table_tab li .table_tab_con").css("display","none");
			$(this).parent().addClass("on");
			$(this).next().css("display","block");
		});
	});

	</script>
</head>

<body>
<!-- head -->
<div id="head">
	<h1>Path Traffic Detail</h1>
    <p class="member"><span>홍길동 (211.12.12.1)</span><a class="btnLogout" href="#"><span>로그아웃</span></a></p>
</div>
<!--// head -->

<!-- container -->
<div id="container">
	<div id="content-area">
		<!-- area -->
		<div id="area">
			<h2>지역</h2>
        	<div class="dataList scl">
				<ul class="dataArea">
					<!-- set by <funtion : select_item_region> -->
				</ul>
			</div>
        </div>
        <!--// area -->

		<!-- DU ID -->
		<div id="duid">
        	<h2>DU 아이디(선번장)</h2>
			<div class="dataList scl">
				<ul class="dataDuid">
					<!--  set by <funtion : select_item_du> -->
				</ul>
			</div>
        </div>
        <!--// DU ID -->

		<!-- content -->
        <div id="content">
			<h2>상세 상태</h2>

			<!-- bbs -->
			<div class="tableType">
				<table summary="">
				<caption></caption>
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>
				<tbody>
					<tr>
						<th>지 역</th>
						<td>강동구</td>
					</tr>
					<tr>
						<th>DU 아이디</th>
						<td>1234567890</td>
					</tr>
					<tr>
						<th>선번장</th>
						<td></td>
					</tr>
				</tbody>
				</table>
			</div>
			<!-- // bbs -->

			<!-- bbs -->
			<div class="tableType">
			<table summary="">
			<caption></caption>
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<thead>
				<tr class="trT">
					<th scope="col">상태</th>
					<th scope="col">Primary</th>
					<th scope="col">상태</th>
					<th scope="col">Secondary</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="aC"><p class="stateON"></p></td>
					<td rowspan="2">
						포트번호: L2 #1-01<br />
						P_ID: 1111-1111-1111<br />
						경보 상태 표시
					</td>
					<td class="aC"><p class="stateOFF"></p></td>
					<td rowspan="2">
						포트번호: L2 #1-01<br />
						P_ID: 1111-1111-1111<br />
						경보 상태 표시
					</td>
				</tr>
				<tr>
					<td class="aC"><p class="stateON"></p></td>
					<td class="aC"><p class="stateOFF"></p></td>
				</tr>
			</tbody>
			</table>
			</div>
			<!-- // bbs -->

			<!-- tab -->
			<div class="tabs_wrap">
				<ul class="table_tab">
					<!--  TRAFFIC  -->
					<li class="on"><a class="menu tab01" href="#manual">TRAFFIC</a>
						<div style="display: block" class="table_tab_con">
						<p class="line"></p>
						<!-- table_tab_con -->
							<!-- bbs -->
							<div class="tableType">
							<table summary="">
							<caption></caption>
							<colgroup>
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
							</colgroup>
							<thead>
								<tr class="trT">
									<th scope="col" colspan="4">현재 지연(ms)</th>
								</tr>
								<tr class="trB">
									<th scope="col" colspan="2">Primary</th>
									<th scope="col" colspan="2">Secondary</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="aC">Uplink</td>
									<td class="aC">57.4</td>
									<td class="aC">Uplink</td>
									<td class="aC">-</td>
								</tr>
								<tr>
									<td class="aC">Downlink</td>
									<td class="aC">67.8</td>
									<td class="aC">Downlink</td>
									<td class="aC">-</td>
								</tr>
							</tbody>
							</table>
							</div>
							<!-- // bbs -->

							<!-- bbs -->
							<div class="tableType">
							<table summary="">
							<caption></caption>
							<colgroup>
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
							</colgroup>
							<thead>
								<tr class="trT">
									<th scope="col" colspan="4">현재 처리속도 (Mbps)</th>
								</tr>
								<tr class="trB">
									<th scope="col" colspan="2">Primary</th>
									<th scope="col" colspan="2">Secondary</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="aC">Uplink</td>
									<td class="aC">-</td>
									<td class="aC">Uplink</td>
									<td class="aC">-</td>
								</tr>
								<tr>
									<td class="aC">Downlink</td>
									<td class="aC">-</td>
									<td class="aC">Downlink</td>
									<td class="aC">-</td>
								</tr>
							</tbody>
							</table>
							</div>
							<!-- // bbs -->
						<!-- //table_tab_con -->
						</div>
					</li>
					<!--//  TRAFFIC  -->

					<!-- IEEE1588 -->
					<li><a class="menu tab02" href="#manua2">IEEE1588</a>
						<div style="display: none" class="table_tab_con">
						<p class="line"></p>
						<!-- table_tab_con -->
							<!-- bbs -->
							<div class="tableType">
							<table summary="">
							<caption></caption>
							<colgroup>
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
							</colgroup>
							<thead>
								<tr class="trT">
									<th scope="col" colspan="4">현재 지연(ms)</th>
								</tr>
								<tr class="trB">
									<th scope="col" colspan="2">Primary</th>
									<th scope="col" colspan="2">Secondary</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="aC">Master>Slave</td>
									<td class="aC">0.2</td>
									<td class="aC">Master>Slave</td>
									<td class="aC">-</td>
								</tr>
								<tr>
									<td class="aC">Slave>Master</td>
									<td class="aC">0.2</td>
									<td class="aC">Slave>Master</td>
									<td class="aC">-</td>
								</tr>
							</tbody>
							</table>
							</div>
							<!-- // bbs -->

							<!-- bbs -->
							<div class="tableType">
							<table summary="">
							<caption></caption>
							<colgroup>
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
							</colgroup>
							<thead>
								<tr class="trT">
									<th scope="col" colspan="4">현재 지터량 (us)</th>
								</tr>
								<tr class="trB">
									<th scope="col" colspan="2">Primary</th>
									<th scope="col" colspan="2">Secondary</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="aC">Master>Slave</td>
									<td class="aC">0.2</td>
									<td class="aC">Master>Slave</td>
									<td class="aC">-</td>
								</tr>
								<tr>
									<td class="aC">Slave>Master</td>
									<td class="aC">0.2</td>
									<td class="aC">Slave>Master</td>
									<td class="aC">-</td>
								</tr>
							</tbody>
							</table>
							</div>
							<!-- // bbs -->
						<!-- //table_tab_con -->
						</div>
					</li>
					<!--// IEEE1588 -->


					<!-- VOLTE -->
					<li><a class="menu tab03" href="#manua3">VOLTE</a>
						<div style="display: none" class="table_tab_con">
						<p class="line"></p>
						<!-- table_tab_con -->
							<!-- bbs -->
							<div class="tableType">
							<table summary="">
							<caption></caption>
							<colgroup>
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
							</colgroup>
							<thead>
								<tr class="trT">
									<th scope="col" colspan="4">현재 Latency (ms)</th>
								</tr>
								<tr class="trB">
									<th scope="col" colspan="2">Primary</th>
									<th scope="col" colspan="2">Secondary</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="aC">Voice</td>
									<td class="aC">12.12</td>
									<td class="aC">Voice</td>
									<td class="aC">-</td>
								</tr>
							</tbody>
							</table>
							</div>
							<!-- // bbs -->

							<!-- bbs -->
							<div class="tableType">
							<table summary="">
							<caption></caption>
							<colgroup>
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
								<col width="25%" />
							</colgroup>
							<thead>
								<tr class="trT">
									<th scope="col" colspan="4">현재 지터량 (us)</th>
								</tr>
								<tr class="trB">
									<th scope="col" colspan="2">Primary</th>
									<th scope="col" colspan="2">Secondary</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="aC">Voice</td>
									<td class="aC">21</td>
									<td class="aC">Voice</td>
									<td class="aC">-</td>
								</tr>
							</tbody>
							</table>
							</div>
							<!-- // bbs -->
						<!-- //table_tab_con -->
						</div>
					</li>
					<!--// VOLTE -->

					<!-- OTHERs -->
					<li><a class="menu tab04" href="#manua3">OTHERs</a>
						<div style="display: none" class="table_tab_con">
						<p class="line"></p>
						<!-- table_tab_con -->
							요기 넣으세용 ppt에 없더라구요.
						<!-- //table_tab_con -->
						</div>
					</li>
					<!--// OTHERs -->
				</ul>
			</div>
			<!-- // tab -->

			<!-- btn -->
			<div class="btnWrap">
				<a class="btnType" href="#"><strong>트래픽 이력 보기</strong></a>
				<a class="btnType" href="#"><strong>저장</strong></a>
				<a class="btnType" href="#"><strong>관리</strong></a>
				<a class="btnType" href="#"><strong>초기화</strong></a>
			</div>
			<!--// btn -->

		</div>
		<!--// content -->
	</div>
</div>
<!--// container -->

<!-- foot -->
<div id="foot">
	<address>Copyright ⓒ JDSU. Co. Ltd.</address>
    <div class="footerMenu">
    	<ul>
        	<li><a href="#">mu 1</a></li>
            <li><a href="#">mu 2</a></li>
            <li class="tel">Tel:000-000-000 / <a href="mailto:test@test.com">Email:test@test.com</a></li>
        </ul>
    </div>
</div>
<!--// foot -->
</body>
</html>