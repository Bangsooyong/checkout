<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><!-- ## WebContent폴더 안에 build 폴더 연동.. -->
    <title>imgur Upload API</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="<c:url value='/resources/build/imgur.min.css'/>" rel="stylesheet" media="screen"><!-- *** 수정 *** -->
    <style>
        .jumbotron h1, .jumbotron p {
            padding-left: 60px;
            padding-right: 60px;
        }

        .col-md {
            margin: 0 auto;
            max-width: 500px
        }
    </style>
</head>
<body>
    <div class="jumbotron">
        <h1>imgur Upload API</h1>
        <p>Upload images to imgur via JavaScript</p>
    </div>

    <div class="col-md">
        <div class="dropzone"></div>
        <!--  -->
        <input type="text" class="i_set" id="i_img" name="i_img" placeholder="각 이미지의 URL을 넣어주세요..."/><br/>
    </div>

    <script type="text/javascript" src="<c:url value='/resources/build/imgur.min.js'/>"></script><!-- *** 수정 *** -->
    <script type="text/javascript">
        var feedback = function (res) {
            if (res.success === true) {
                document.querySelector('.status').classList.add('bg-success');
                document.querySelector('.status').innerHTML = 'Image url: ' + res.data.link;

               /*  var result = $('.bg-success').clone();
            	alert( result.text() );   */ 
            }
        };

        new Imgur({
            clientid: '7ff152b0e154c31', /* http://imgur.com/ 에서 아이디를 만들어 발급했음  */
            callback: feedback // TODO: 사진을 업로드하면 사진은 imgur서버상에 존재... 그러나 웹 사이트 계정에선 확인 불가...
        });

        
    </script>
    
	 <script>      
  	$(document).ready(function() {
  		function readUrl() {
  			// var result = $('.status bg-success').clone();
  	    	// alert( result.text() );
  	    	var url = $('.status bg-success').text();
  	    	
  	    	$('#i_img').text(url);
  		}
  		
  		$('#i_img').mouseenter(readUrl);
  	});
		
    </script> 
</body>
</html>