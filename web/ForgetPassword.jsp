<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forget Password</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./style.css">
    </head>
    <body>
        <section id="header" class="header-forget-password">
            <div class="container">
                <div class="row align-items-center h-78">
                    <div class="col-md-1">
                        <div class="header-logo">
                            <a href="BookURL"><img src="./images/Logo.jpg" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="forget-password-body">
            <form action="resetPassword" method="post" class="mx-auto">
                <div class="bg-white p-5 form-forget-password">
                    <h1 class="text-center fw-bold">Forget Password</h1>
                    <div class="border-bottom">
                        <span class="fs-5 fw-bold text-black-weak">Email</span>
                        <div class="d-flex align-items-center fs-4 mt-3">
                            <i class='bx bx-envelope'></i>
                            <input type="email" name="email" placeholder="Email" class="w-100 py-4 outline-0 border-0 ms-3" required />
                        </div>
                    </div>
                    <div class="text-center mt-3 fs-5">
                        Remember your password? <a href="login" class="text-black-weak text-info">Login</a>
                    </div>
                    <div class="d-flex justify-content-center">
                        <div class="error-message">${mess != null ? mess : ""}</div>
                    </div>
                    <button type="submit" class="d-flex align-items-center justify-content-center mt-5 fw-bold py-2 fs-4 px-5 btn bg-danger text-white mx-auto">Submit</button>
                </div>
            </form>
        </section>
    </body>
</html>
<style>
    .error-message {
        color: red;
        font-size: 1.25rem;
        font-weight: bold; /* Makes the font bold */
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>
