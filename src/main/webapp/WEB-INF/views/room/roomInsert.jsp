<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 사이트</title>

<!-- jquery 이미지 미리보기 -->
<style type="text/css">
	.imgs_wrap {
		width: 300px;
		margin-top: 30px;
	}
	.imgs_wrap img {
		max-width: 100px;
	}
	.imgs_wrap2 {
		width: 450px;
		margin-top: 30px;
	}
	.imgs_wrap2 img {
		max-width: 150px;
	}
</style>
<script type="text/javascript">
	var sel_files = [];
	
	$(document).ready(function() {
		$("#input_imgs").on("change", handleImgsFilesSelect);
	});
	$(document).ready(function() {
		$("#input_imgs2").on("change", handleImgsFilesSelect2);
	});
	
	function handleImgsFilesSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var img_html = "<img src=\"" + e.target.result + "\" />";
				$(".imgs_wrap").append(img_html);
			}
			reader.readAsDataURL(f);
		});
	}
	function handleImgsFilesSelect2(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var img_html = "<img src=\"" + e.target.result + "\" />";
				$(".imgs_wrap2").append(img_html);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
</head>
<body>
	<div class="container">
		<div>
			<!-- 점보트론 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="roomInsert" enctype="multipart/form-data">
					<h3 style="text-align: center;">스터디 룸 등록</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="스터디룸 이름"
							name="ro_title" maxlength="20">
					</div>
					<div class="form-group">
						<textarea name="ro_content" class="form-control col-lg-12" rows="7"></textarea>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="form group" style="text-align: center">
								대표 이미지<p><p>
								<input name="file2" type="file" id="input_imgs2">
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form group" style="text-align: center">
								<div class="form-group">
									대표이미지 미리보기<p><p>
									<div class="imgs_wrap2">
										<!-- 이미지 나오는 부분 -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<p>
					<div class="row">
						<div class="col-lg-5">
							<div class="form group" style="text-align: center">
								이미지들<p><p>
								<input multiple="multiple" name="file" type="file" id="input_imgs">
							</div>
						</div>
						<div class="col-lg-7">
							<div class="form group" style="text-align: center">
								<div class="form-group">
									이미지들 미리보기<p><p>
									<div class="imgs_wrap">
										<!-- 이미지 나오는 부분 -->
									</div>
								</div>
							</div>
						</div>
					</div>
						<p>
					<div class="row">
						<div class="col-lg-4">
							<div class="form group" style="text-align: center">
							오전 가격<p>
							<input type="text" name="morning" placeholder="오전 가격">
							</div>
						</div>
						<div class="col-lg-4">
							<div class="form group" style="text-align: center">
							오후 가격<p>
							<input type="text" name="afternoon" placeholder="오후 가격">
							</div>
						</div>
						<div class="col-lg-4">
							<div class="form group" style="text-align: center">
							밤 가격<p>
							<input type="text" name="night" placeholder="밤 가격">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							위도<p>
							<input type="text" name="spot1" placeholder="위도"><br>
							경도<p>
							<input type="text" name="spot2" placeholder="경도"><br>
						</div>
						<div class="col-lg-6">
							<select name="ro_loc">
								<option value="강남구">강남구</option>
								<option value="강동구">강동구</option>
								<option value="강북구">강북구</option>
								<option value="강서구">강서구</option>
								<option value="관악구">관악구</option>
								<option value="광진구">광진구</option>
								<option value="구로구">구로구</option>
								<option value="금천구">금천구</option>
								<option value="노원구">노원구</option>
								<option value="도봉구">도봉구</option>
								<option value="동대문구">동대문구</option>
								<option value="동작구">동작구</option>
								<option value="마포구">마포구</option>
								<option value="서대문구">서대문구</option>
								<option value="서초구">서초구</option>
								<option value="용산구">용산구</option>
								<option value="은평구">은평구</option>
								<option value="종로구">종로구</option>
								<option value="중구">중구</option>
								<option value="중랑구">중랑구</option>
							</select>
						</div>
					</div>
					<div class="form group">
						<input type="submit" class="btn btn-primary form-control" value="방등록">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="message"></div>
</body>
</html>





















