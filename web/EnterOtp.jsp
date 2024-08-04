<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enter OTP</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./style.css">
    </head>
    <body>
        <section id="header" class="header-login">
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
        <section class="otp-body">
            <form action="ValidateOtp" method="POST" class="mx-auto">
                <div class="bg-white p-5 form-login">
                    <h1 class="text-center fw-bold">Enter OTP</h1>
                    <div class="border-bottom">
                        <span class="fs-5 fw-bold text-black-weak">OTP</span>
                        <div class="d-flex align-items-center fs-4 mt-3">
                            <i class='bx bx-lock'></i>
                            <input type="text" name="otp" placeholder="Enter OTP" class="w-100 py-4 outline-0 border-0 ms-3" required />
                        </div>
                    </div>
                    <div class="d-flex justify-content-center">
                        <div class="error-message">${message != null ? message : ""}</div>
                    </div>
                    <button type="submit" class="d-flex align-items-center justify-content-center mt-5 fw-bold py-2 fs-4 px-5 btn bg-danger text-white mx-auto">Reset Password</button>
                    <div class="text-center mt-3">
                        <a href="login" class="back-to-login-link">Back to login</a>
                    </div>
                    <div class="instructions mt-5">
                        <h2 class="text-center">How to use OTP:</h2>
                        <ol class="list-group list-group-numbered mt-3">
                            <li class="list-group-item">Enter the OTP sent to your email in the field above.</li>
                            <li class="list-group-item">Click the "Reset Password" button.</li>
                            <li class="list-group-item">Follow the instructions to reset your password.</li>
                        </ol>
                    </div>
                </div>
            </form>
        </section>
    </body>
</html>
<style>
    .otp-body {
        background-color: rgb(255, 235, 0);
        background: linear-gradient(0deg, rgba(255, 235, 0, 0.14338235294117652) 0%, rgba(253, 45, 245, 0.11257002801120453) 100%);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .error-message {
        color: red;
        font-size: 1.25rem;
        font-weight: bold;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .back-to-login-link {
        color: #0dcaf0;
        text-decoration: none;
        font-size: 1rem;
        font-weight: bold;
    }

    .back-to-login-link:hover {
        text-decoration: underline;
    }

    .instructions {
        color: #000;
        font-size: 1.2rem;
    }
</style>
