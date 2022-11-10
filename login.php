<?php  
require('koneksi.php');

session_start();

if (isset($_POST['submit'])) {
    $email = $_POST['txt_email'];
    $pass = $_POST['txt_password'];
    
    if (!empty(trim($email)) && !empty(trim($pass))) {
        $query      = "SELECT * FROM user_detail WHERE user_email = '$email'";
        $result     = mysqli_query($koneksi, $query);
        $num        = mysqli_num_rows($result);

        while ($row = mysqli_fetch_array($result)) {
            $id = $row['id'];
            $userVal = $row['user_email'];
            $passVal = $row['user_password'];
            $userName = $row['user_fullname'];
            $level = $row['level'];

        }

        if ($num != 0) {
            if ($userVal==$email && $passVal==$pass) {
                $_SESSION['id'] = $id;
                $_SESSION['name'] = $userName;
                $_SESSION['level'] = $level;
                header('Location: home.php');
            }else{
                $error = 'user atau password salah!!';
                echo "<script>alert('$error')</script>";
                header('Location: login.php');
            }
        }else{
            $error = 'user tidak ditemukan!!';
            echo "<script>alert('$error')</script>";
            header('Location: login.php');
        }
    }else{
        $error = 'Data tidak boleh kosong!!';
        echo "<script>alert('$error')</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Design by foolishdeveloper.com -->
    <title>Yooks! Login</title>
 
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <!--Stylesheet-->
    <style media="screen">
      *,
*:before,
*:after{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
body{
    background-color: #ffffff;
}
.background{
    width: 430px;
    height: 520px;
    position: absolute;
    transform: translate(-50%,-50%);
    left: 50%;
    top: 50%;
}
.background .shape{
    height: 200px;
    width: 200px;
    position: absolute;
    border-radius: 50%;
}
.shape:first-child{
    background: linear-gradient(
        #fce622,
        #f3a513
    );
    left: -80px;
    top: -80px;
}
.shape:last-child{
    background: linear-gradient(
        to right,
        #ff512f,
        #f09819
    );
    right: -80px;
    bottom: -80px;
}
form{
    height: 520px;
    width: 400px;
    background-color: rgba(255,255,255,0.13);
    position: absolute;
    transform: translate(-50%,-50%);
    top: 50%;
    left: 50%;
    border-radius: 10px;
    backdrop-filter: blur(15px);
    border: 2px solid rgba(255,255,255,0.1);
    box-shadow: 0 0 40px rgba(8,7,16,0.6);
    padding: 50px 35px;
}
form *{
    font-family: 'Poppins',sans-serif;
    color: #000000;
    letter-spacing: 0.5px;
    outline: none;
    border: none;
}
form h3{
    font-size: 32px;
    font-weight: 500;
    line-height: 42px;
    text-align: center;
}

label{
    display: block;
    margin-top: 30px;
    font-size: 16px;
    font-weight: 500;
    color:rgb(0, 0, 0)
}
input{
    display: block;
    height: 50px;
    width: 100%;
    background-color: rgb(236, 236, 236);
    border-radius: 3px;
    padding: 0 10px;
    margin-top: 8px;
    font-size: 14px;
    font-weight: 300;
}
::placeholder{
    color: #000000;
}
button{
    margin-top: 50px;
    width: 100%;
    background-color: #fc5d35;
    color: #ffffff;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 5px;
    cursor: pointer;
}
.social{
  margin-top: 30px;
  display: flex;
}
.social div{
  background: red;
  width: 150px;
  border-radius: 3px;
  padding: 5px 10px 10px 5px;
  background-color: rgba(255,255,255,0.27);
  color: #eaf0fb;
  text-align: center;
}
.social div:hover{
  background-color: rgba(255,255,255,0.47);
}
.social .fb{
  margin-left: 25px;
}
.social i{
  margin-right: 4px;
}

    </style>
</head>
<body>
    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    <form action="login.php" method="post">
        <h3>Login</h3>

        <label for="username">Username</label>
        <input type="text" placeholder="Email or Phone" id="username" name="txt_email">

        <label for="password">Password</label>
        <input type="password" placeholder="Password" id="password" name="txt_password">
        <button name="submit">Log In</button><br><br>
            <div class="text-center">
                <a class="small" href="register.php">Belum punya akun? Daftar sekarang!</a>
            </div>
    </form>
</body>
</html>