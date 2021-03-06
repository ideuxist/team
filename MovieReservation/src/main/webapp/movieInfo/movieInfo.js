console.log('hello!');

// data for API and parameter
let key = "6446bae76aaffa9af6d4c00b2299f016";
let srcPara = new URL(location.href).searchParams;

// tag collection
let posterDiv = document.querySelector('.poster');
let titleDiv = document.getElementById('title')
let overviewDiv = document.getElementById('overview');
let relDateDiv = document.getElementById('relDate');
let reserveBtn = document.getElementById('reserveBtn');

reserveBtn.addEventListener('click', e => {
    let url = `../reservation/reservation.tiles?`;
    location.href = url;
})

// retrieve movie infomation
function getMovie() {
    let url = `https://api.themoviedb.org/3/movie/${movieId}?api_key=${key}&language=ko-KR`

    fetch(url)
        .then(res => res.json())
        .then(res => {
            // getTrailer(res.imdb_id);

            let base_url = "https://image.tmdb.org/t/p/w500";
            let poster = base_url + res.poster_path;
            let img = document.createElement('img');
            img.setAttribute("id", "posterImg");
            img.src = poster;
            posterDiv.appendChild(img);

            let title = res.original_title;
            let h1 = document.createElement('h1');
            h1.innerHTML = title;
            titleDiv.appendChild(h1);

            let overview = res.overview;
            let p = document.createElement('p');
            p.innerHTML = overview;
            overviewDiv.appendChild(p);

            let relDate = res.release_date;
            let h3 = document.createElement('h3');
            h3.innerHTML = relDate;
            relDateDiv.appendChild(h3);
        })
};

// get trailer
let trailerDiv = document.querySelector('.trailer');

function getTrailer(id) {
    let url = `https://imdb-api.com/en/API/YouTubeTrailer/k_wfatj861/${id}`

    fetch(url)
        .then(res => res.json())
        .then(res => {
            let vid = document.createElement('iframe');
            vid.width = 300;
            vid.height = 300;
            let key = res.videoId;
            vid.src = `https://www.youtube.com/embed/${key}?autoplay=0`;
            trailerDiv.appendChild(vid);
        })
}

// pagination session
let current_page = 1;
let totNumPages = 0;
let pagination = document.getElementById('pagination');

function makePage() {
    let url = `../commentPage.go`;

    fetch(url, {
            method: 'post',
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `movieId=${movieId}`
        })
        .then(res => res.json())
        .then(res => {
            totNumPages = Math.ceil(res.count / 5);
            pagination.innerHTML = "";
            for (let i = 1; i <= totNumPages; i++) {
                let btn = document.createElement('input');
                btn.setAttribute("type", "button");
                btn.setAttribute("class", "pageBtn");
                btn.value = ` ${i} `;
                btn.addEventListener('click', e => {
                    showComment(i);
                })
                pagination.appendChild(btn);
            }
        })
}

// next, prev section
let btn_prev = document.getElementById("btn_prev");
btn_prev.addEventListener('click', prevPage);
let btn_next = document.getElementById("btn_next");
btn_next.addEventListener('click', nextPage);

function prevPage() {
    if (current_page > 1) {
        current_page--;
        change(current_page);
    }
}

function nextPage() {
    if (current_page < totNumPages) {
        current_page++;
        change(current_page);
    }
}

function change(page) {
    if (page < 1) page = 1;
    if (page > totNumPages) page = totNumPages;
    showComment(page);
}

// show comment section
let table = document.getElementById('cmtTable');

function showComment(page) {
    table.innerHTML = "";

    let url = `../commentList.go`;
    fetch(url, {
            method: 'post',
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `movieId=${movieId}&page=${page}`
        })
        .then(res => res.json())
        .then(res => {
            res.forEach(element => {
                let tr = document.createElement('tr');

                let id = document.createElement('td');
                id.innerHTML = element.id;
                id.setAttribute("width", "100");
                tr.appendChild(id);

                let cmt = document.createElement('td');
                cmt.innerHTML = element.cmt;
                cmt.setAttribute("width", "300");
                tr.appendChild(cmt);

                let stars = document.createElement('td');
                stars.innerHTML = `&#11088;${element.stars}`;
                stars.setAttribute("width", "10");
                stars.setAttribute("align", "center")
                tr.appendChild(stars);

                let date = document.createElement('td');
                date.innerHTML = element.date;
                date.setAttribute("width", "100");
                date.setAttribute("align", "center")
                tr.appendChild(date);

                let del = document.createElement('td');
                del.addEventListener('click', e => {
                    if (sessionId == element.id) {
                        delComment(element.code);
                    } else {
                        alert("????????? ????????? ???????????? ????????? ??? ????????????.");
                    }
                })
                del.setAttribute("width", "10");
                del.setAttribute("align", "center")
                del.innerHTML = '&#10060;';
                tr.appendChild(del);

                table.appendChild(tr);
            })
        })
}

function delComment(val) {
    let url = `../commentDel.go`;
    fetch(url, {
            method: 'post',
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `code=${val}`
        })
        .then(res => {
            makePage();
            showComment(1);
            ratingDiv.innerHTML = "";
            getRating();
        })
}

// add comment section
let addBtn = document.getElementById('addBtn');
addBtn.addEventListener('click', addComment);

function addComment() {
    if (sessionId == '') {
        alert("??????????????????");
    } else {
        console.log(sessionId);

        let url = `../commentAdd.go`;

        let comment = document.getElementById('area').value;
        let stars = document.querySelectorAll('.star-rating>input');
        let val = 0;

        stars.forEach(element => {
            if (element.checked == true) {
                val = element.value;
            }
        })

        if (val == 0 || comment == null) {
            alert("?????? ????????? ???????????????")
        } else {
            fetch(url, {
                    method: 'post',
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: `comment=${comment}&stars=${val}&movieId=${movieId}&id=${sessionId}`
                })
                .then(res => {
                    document.getElementById('area').value = "";
                    stars.forEach(element => {
                        element.checked = false;
                    })
                    makePage();
                    showComment(1);
                    ratingDiv.innerHTML = "";
                    getRating();
                })
        }
    }
}

// Rating setion
let ratingDiv = document.getElementById('ratingDiv')

function getRating() {
    let url = `../getRating.go`;

    fetch(url, {
            method: 'post',
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `movieId=${movieId}`
        })
        .then(res => res.json())
        .then(res => {
            let a = document.createElement('a');
            a.innerHTML = `${res.rating}`;
            ratingDiv.appendChild(a);
        })
}

// // when clicking a like btn
let likeCount = document.getElementById('likeCount');
let likesDiv = document.getElementById('likesDiv');
likesDiv.addEventListener('click', e => {
    if (sessionId == '') {
        alert("??????????????????");
    } else {
        likeCount.innerHTML = "";
        likeCheck();
    }
});

function likeCheck() {
    if (checkLike == 0) {
        checkLike = 1;
        likes = (parseInt(likes) + 1);
        console.log(likes);
        clickLike(checkLike)
    } else if (checkLike == 1) {
        checkLike = 0;
        likes = (parseInt(likes) - 1);
        console.log(likes);
        clickLike(checkLike);
    }
}

function clickLike(val) {
    let url = `../clickLike.go`

    fetch(url, {
            method: 'post',
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `movieId=${movieId}&id=${sessionId}&bool=${val}`
        })
        .then(res => {
            likeCount.innerHTML = parseInt(likes);
        })
}

function infoPage() {
    getMovie();
    makePage();
    showComment(current_page);
    getRating();
    likeCount.innerHTML = likes;
}

window.addEventListener('onLoad', infoPage());