
function setImg(event) {
	for (var image of event.target.files) {
		var reader = new FileReader();
		
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#imageContainer").appendChild(img);
			};
			console.log(image);
			reader.readAsDataURL(image); 
			}
	
}
//사진첨부시 경로표시
$("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	});


//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        let result = document.getElementById('rate');
        console.log(elem);
        console.log(elem.value);
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
            result.value = rating.rate
        }
    })
});
