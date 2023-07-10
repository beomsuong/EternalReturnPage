<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqFjcJ6pajs/rfdfs3SO+kD4Ck5BdPtF+to8xM6B5z6W5" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
    .button-container {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        gap: 10px;
    }
    button 
        position: relative; // 이미지가 버튼의 크기에 맞게 조정되도록
        overflow: hidden; // 버튼을 벗어나는 이미지 부분이 보이지 않게
    }
    img {
        position: absolute; // 이미지가 버튼의 크기에 맞게 조정되도록
    }
</style>

<script>
    window.onload = function() {
        var buttonContainer = document.querySelector(".button-container");
        for(var i = 0; i < 1; i++) { // 이 숫자를 원하는 버튼의 수로 변경할 수 있습니다.
            var button = document.createElement("button");
            button.id = "button" + i;
            button.className = "btn btn-light";
            var img = document.createElement("img");
            img.src = i+".png"; // 여기에 원하는 이미지 URL을 입력합니다.
            button.appendChild(img);
            button.onclick = registerFunction;
            buttonContainer.appendChild(button);
        }
    }

    function registerFunction(event) {
        var buttonIndex = event.target.id.replace("button", "");
        alert("Button clicked! "+ buttonIndex);
    }
</script>



</head>
<body>
<div class="button-container">
</div>
</body>
</html>
