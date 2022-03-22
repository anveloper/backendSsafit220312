document.getElementsByName("btnradio").forEach(btn => btn.addEventListener('click',()=>{
			selectPart(btn.value);
		}));

function selectPart(fitPart) {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = () => {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let videoHtml = "";
			let videoList = JSON.parse(xhr.response);
			videoList.forEach((video) =>{
				if(video.fitPartName == fitPart){
					videoHtml +=`
					<div class="p-2 w-380" style="width: 390px;">
						<div>
							<iframe width="380" height="230"
								src="https://www.youtube.com/embed/${video.youtubeId}"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>
						<div class="row" style="width: 380px;">
							<a class="col video-title" href="detail?youtubeId=${video.youtubeId}">${video.title}</a>
						</div>
					</div>					
					`;
				}
			});
			
			document.querySelector("#fitPart").innerHTML = videoHtml;
		}
	}
	xhr.open("GET", "/06-ssafitDB/ssafit/data/video.json", true);
	xhr.send(null);
};