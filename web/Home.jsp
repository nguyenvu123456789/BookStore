<%-- 
    Document   : Home
    Created on : 13 Oct, 2023, 11:30:28 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.text.Normalizer" %>
<%@page import="java.util.regex.Pattern" %>
<%@page import="DAL.*" %>
<%@page import="Models.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <link rel="stylesheet" href="./style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer"
              />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body>
        <%@include file="./Header.jsp" %>
        <h3>${requestScope.linkProduct!=null?requestScope.linkProduct:''}</h3>
        <section id="banner">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slider-img">
                            <img src="./images/B1.jpg" alt="">
                        </div>
                        <div class="slider-info">
                            <h2 class="slider-title">Exclusive collection for everyone</h2>
                            <p class="slider-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam tenetur molestiae magnam.</p>
                            <a href="BookURL" class="slider-button">
                                Order now
                                <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slider-img">
                            <img src="./images/B2.jpg" alt="">
                        </div>
                        <div class="slider-info">
                            <h2 class="slider-title">Exclusive collection for everyone</h2>
                            <p class="slider-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam tenetur molestiae magnam.</p>
                            <a href="BookURL" class="slider-button">
                                Order now
                                <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slider-img">
                            <img src="./images/B3.jpg" alt="">
                        </div>
                        <div class="slider-info">
                            <h2 class="slider-title">Exclusive collection for everyone</h2>
                            <p class="slider-desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aperiam tenetur molestiae magnam.</p>
                            <a href="BookURL" class="slider-button">
                                Order now
                                <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-next">

                </div>
                <div class="swiper-button-prev">

                </div>
                <div class="swiper-pagination"></div>
            </div>
        </section>
        <section id="body" class="mt-5">
            <div class="container">

                <h2 class="fs-40 my-5 fw-bold">
                    <a href="BookURL" class="black-link">Explore</a>.
                    <span class="black-weak">Top of book this week</span>
                </h2>

                <div class="row gx-4">
                    <div class="col-md-3 mt-4">
                        <div class="dis-item">
                            <div class="dis-info">
                                <div class="info-text">
                                    <p>Explore new arrivals</p>
                                    <h2>Shop the latest <br>from top Adventure book</h2>
                                </div>
                                <a href="BookDetail?Pid=21"><button>Show me this</button></a>
                            </div>
                            <img src="./images/Top1.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-md-3 mt-4">
                        <div class="dis-item">
                            <div class="dis-info">
                                <div class="info-text">
                                    <p>Explore new arrivals</p>
                                    <h2>Shop the latest <br>from top Novel book</h2>
                                </div>
                                <a href="BookDetail?Pid=22"><button>Show me this</button></a>
                            </div>
                            <img src="./images/Top2.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-md-3 mt-4">
                        <div class="dis-item">
                            <div class="dis-info">
                                <div class="info-text">
                                    <p>Explore new arrivals</p>
                                    <h2>Shop the latest <br>from top Comic</h2>
                                </div>
                                <a href="BookDetail?Pid=23"><button>Show me this</button></a>
                            </div>
                            <img src="./images/Top3.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-md-3 mt-4">
                        <div class="dis-item">
                            <div class="dis-info">
                                <div class="info-text">
                                    <p>Explore new arrivals</p>
                                    <h2>Shop the latest <br>from top Horror book</h2>
                                </div>
                                <a href="BookDetail?Pid=24"><button>Show me this</button></a>
                            </div>
                            <img src="./images/Top4.jpg" alt="">
                        </div>
                    </div>
                </div>



                <h2 class="fs-40 my-5 fw-bold">
                    <a href="BookURL" class="black-link">Discover more</a>.
                    <span class="black-weak">The world is waiting for you to explore</span>
                </h2>



            </div>
        </section>
        <!-- Logo section -->


        <section id="logos" class="mt-5 py-4 bg-light">
            <div class="container text-center">
                <div class="row">
                    <div class="col-6 col-md-3">
                        <a href="BookURL?Service=filter&category=Adventure" class="logo-link">
                            <figure>
                                <img src="./images/AdventureLogo.png" alt="Logo 1" class="img-fluid logo-image">
                                <figcaption>Adventure</figcaption>
                            </figure>
                        </a>
                    </div>
                    <div class="col-6 col-md-3">
                        <a href="BookURL?Service=filter&category=Novel" class="logo-link">
                            <figure>
                                <img src="./images/ComicLogo.jpg" alt="Logo 2" class="img-fluid logo-image">
                                <figcaption>Comic</figcaption>
                            </figure>
                        </a>
                    </div>
                    <div class="col-6 col-md-3">
                        <a href="BookURL?Service=filter&category=Novel" class="logo-link">
                            <figure>
                                <img src="./images/NovelLogo.jpg" alt="Logo 3" class="img-fluid logo-image">
                                <figcaption>Novel</figcaption>
                            </figure>
                        </a>
                    </div>
                    <div class="col-6 col-md-3">
                        <a href="BookURL?Service=filter&category=Detective" class="logo-link">
                            <figure>
                                <img src="./images/DetectiveLogo.png" alt="Logo 4" class="img-fluid logo-image">
                                <figcaption>Detective</figcaption>
                            </figure>
                        </a>
                    </div>
                    <div class="col-6 col-md-3">
                        <a href="BookURL?Service=filter&category=History" class="logo-link">
                            <figure>
                                <img src="./images/HistoryLogo.jpg" alt="Logo 5" class="img-fluid logo-image">
                                <figcaption>History</figcaption>
                            </figure>
                        </a>
                    </div>
                    <div class="col-6 col-md-3">
                        <a href="BookURL?Service=filter&category=Romance" class="logo-link">
                            <figure>
                                <img src="./images/RomanceLogo.png" alt="Logo 6" class="img-fluid logo-image">
                                <figcaption>Romance</figcaption>
                            </figure>
                        </a>
                    </div>
                    <div class="col-6 col-md-3">
                        <a href="BookURL?Service=filter&category=Science%20Fiction" class="logo-link">
                            <figure>
                                <img src="./images/ScienceLogo.jpg" alt="Logo 7" class="img-fluid logo-image">
                                <figcaption>Science</figcaption>
                            </figure>
                        </a>
                    </div>
                    <div class="col-6 col-md-3">
                        <a href="BookURL?Service=filter&category=Horror" class="logo-link">
                            <figure>
                                <img src="./images/HorrorLogo.jpg" alt="Logo 8" class="img-fluid logo-image">
                                <figcaption>Horror</figcaption>
                            </figure>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog section -->
        <section id="blog-section" class="mt-5 py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 d-flex align-items-center">
                        <div>
                            <a href="listBlog" class="Blog-link">
                                <h2 class="fs-40 fw-bold">LEARN MORE ABOUT BOOKS FROM THE BLOG.</h2>
                                <p class="fs-20">Explore our blog to find your next favorite reads.</p>
                            </a>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <a href="blog" class="image-container">
                            <img src="./images/BLOGHOME.jpg" alt="Custom Image" class="img-fluid">
                            <span class="overlay-text">View All</span>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <!-- wish list section -->
        <section id="wishlist-section" class="mt-5 py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <a href="#" class="image-container">
                            <img src="./images/Wishlist1.jpg" alt="Custom Image" class="img-fluid">
                            <span class="overlay-text">View All</span>
                        </a>
                    </div>
                    <div class="col-md-6 d-flex align-items-center">
                        <div>
                            <a href="#" class="custom-link">
                                <h2 class="fs-40 fw-bold">GET BOOKS FOR YOUR WISHLIST.</h2>
                                <p class="fs-20">View all Book to find ur wishlist book.</p>
                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </section>


        <%@include file="./Footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

        <!--Css LOGO behind-->
        <style>
            .logo-image {
                width: 100px;
                height: 100px;
                object-fit: contain;
            }

            figure {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            figcaption {
                margin-top: 8px;
                font-size: 1.25rem; /* Tăng kích thước phông chữ */
                font-weight: bold; /* Làm cho phông chữ đậm hơn */
            }
        </style>


        <!-- Initialize Swiper -->
        <script>
            var swiper = new Swiper(".mySwiper", {
                spaceBetween: 30,
                centeredSlides: true,
                loop: true,
                speed: 1500,

                autoplay: {
                    delay: 5000,
                    disableOnInteraction: false,
                },
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
            });
        </script>
    </body>
</html>
<!--<script src="./js/app.js"></script>-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script>
            function handleSearch() {
                const headerInput = document.getElementById("header-search");
                window.location = "?Service=search&keyword=" + headerInput.value;
            }

            // Lắng nghe sự kiện khi click vào "Clear all"
            document.getElementById("clearAll").addEventListener("click", function () {
                // Duyệt qua tất cả input radio và bỏ chọn chúng
                var checkboxInput = document.querySelectorAll("input[type=checkbox]");
                checkboxInput.forEach(function (input) {
                    input.checked = false;
                });

                var radioInputs = document.querySelectorAll("input[type=radio]");
                radioInputs.forEach(function (input) {
                    input.checked = false;
                });

                // Gửi form để quay về đường dẫn gốc
                window.location = "BookURL"
            }
            );

</script>
</script>
</body>
</html>

<!--CSS-->
<style>
    .black-link {
        text-decoration: none;
        color: black;
    }

    .black-link:hover {
        color: gray;
    }
    .logo-link {
        text-decoration: none;
        color: black;
    }

    .logo-link:hover figcaption {
        color: #ff00a6;
    }

    /* CSS to change button text color on hover */
    /* CSS to change button text color and make it bold on hover */
    /* CSS to change button text color to yellow and make it extremely bold on hover */
    .dis-item .dis-info a button:hover {
        color: red;
        font-weight: 700;
    }

    .custom-link {
        text-decoration: none; /* Bỏ gạch chân */
        color: #ff00a6; /* Màu chữ mặc định */
        transition: color 0.3s; /* Hiệu ứng chuyển đổi màu chữ */
    }

    .custom-link:hover {
        color: red; /* Màu chữ khi hover */
    }
    .Blog-link {
        text-decoration: none; /* Bỏ gạch chân */
        color: #4CAF50; /* Màu chữ mặc định (màu xanh lá cây) */
        transition: color 0.3s; /* Hiệu ứng chuyển đổi màu chữ */
    }

    .Blog-link:hover {
        color: #388E3C; /* Màu chữ khi hover (màu xanh lá cây đậm hơn) */
    }
    .image-container {
        position: relative;
        display: inline-block;
    }

    .overlay-text {
        position: absolute;
        top: 250px;
        left: 150px;
        transform: translate(-50%, -50%);
        z-index: 1;
        background-color: rgba(0, 0, 0, 0.7);
        color: white;
        padding: 10px;
        font-family: Arial, sans-serif;
        font-size: 18px;
        transition: transform 0.3s ease; /* Hiệu ứng phóng to */
        transform-origin: center; /* Điểm gốc của transform */
    }

    .image-container:hover .overlay-text {
        transform: scale(1.2) translate(-50%, -50%); /* Phóng to và giữ nguyên vị trí */
    }
</style>