let srcPara = new URL(location.href).searchParams;
let keyword = srcPara.get('keyword');
console.log(keyword);
let key = "6446bae76aaffa9af6d4c00b2299f016";
console.log(key);

let mainContainer = document.getElementById('mainContainer');

function searchMovie() {
    let url = `https://api.themoviedb.org/3/search/movie?api_key=${key}&language=kr-KR&query=${keyword}&page=1&include_adult=false`

    fetch(url)
        .then(res => res.json())
        .then(res => {
            let ary = res.results;
            ary.forEach(Element => {
                console.log(Element);

                let posterDiv = document.createElement('div');
                posterDiv.className = "poster";

                let titleDiv = document.createElement('div');
                titleDiv.className = "title";

                let relDateDiv = document.createElement('div');
                relDateDiv.className = "release";

                let container = document.createElement('div');
                container.className = "container";
                container.style.cursor = "pointer";

                let base_url = "https://image.tmdb.org/t/p/w500";
                let poster = base_url + Element.poster_path;
                let img = document.createElement('img');
                img.setAttribute("id", "posterImg");
                img.setAttribute("height", "200px")
                img.src = poster;
                posterDiv.appendChild(img);
                container.appendChild(posterDiv);

                let title = Element.title;
                let h2 = document.createElement('h2');
                h2.innerHTML = title;
                titleDiv.appendChild(h2);
                container.appendChild(titleDiv);

                let relDate = Element.release_date;
                let h3 = document.createElement('h3');
                h3.innerHTML = relDate;
                relDateDiv.appendChild(h3);
                container.appendChild(relDateDiv);

                container.addEventListener('click', e => {
                    let url = `../movieInfo/movieInfo.tiles?movieId=${Element.id}`;
                    // window.open(url);
                    location.href = url;
                })
                mainContainer.appendChild(container);
            });

        })
}

window.addEventListener('onLoad', searchMovie());