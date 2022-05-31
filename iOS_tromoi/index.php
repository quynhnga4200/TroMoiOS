<?php
$conn = mysqli_connect("127.0.0.1", "root", "", "ios_tromoi", "3308");
mysqli_set_charset($conn, "utf8mb4");

$type = !empty($_POST) ? "post" : "get";
$action = $_GET["action"];
//127.0.0.1/?type=get&action=...
switch ($type) {
    case 'get':
        switch ($action) {
            case 'getAllRoom':
                $query = "SELECT * FROM `room`";
                $queryDB = mysqli_query($conn, $query);
                $data = mysqli_fetch_all($queryDB, MYSQLI_ASSOC);
                echo json_encode($data);
                break;
            case 'getRoomById':
                $id = $_GET["id"];
                $query = "SELECT * FROM `room` WHERE `id` = $id";
                $queryDB = mysqli_query($conn, $query);
                $data = mysqli_fetch_all($queryDB, MYSQLI_ASSOC);
                echo json_encode($data[0]);
                break;
            case 'getRoomByLoaiphongId':
                $id = $_GET["id"];
                $query = "SELECT room.* FROM `room` JOIN `loaiphong` ON room.loaiphongid = loaiphong.id WHERE loaiphong.id = $id";
                $queryDB = mysqli_query($conn, $query);
                $data = mysqli_fetch_all($queryDB, MYSQLI_ASSOC);
                echo json_encode($data);
                break;
            case 'getRoomByLoaiphongId':
                $id = $_GET["id"];
                $query = "SELECT room.* FROM `room` JOIN `loaitin` ON room.loaitinid = loaitin.id WHERE loaitin.id = $id";
                $queryDB = mysqli_query($conn, $query);
                $data = mysqli_fetch_all($queryDB, MYSQLI_ASSOC);
                echo json_encode($data);
                break;
            case 'searchRoomByName':
                $name = $_GET["search"];
                $query = "SELECT * FROM `room` WHERE `Tieude` LIKE \"%$name%\"";
                $queryDB = mysqli_query($conn, $query);
                $data = mysqli_fetch_all($queryDB, MYSQLI_ASSOC);
                echo json_encode($data);
                break;
        }
        break;
    case 'post':
        switch ($action) {
            case 'createRoom':
                $loaitinid = $_POST["loaitinid"];
                $loaiphongid = $_POST["loaiphongid"];
                $giaphong = $_POST["giaphong"];
                $dientich = $_POST["dientich"];
                $DiaChi = $_POST["DiaChi"];
                $Tieude = $_POST["Tieude"];
                $Chitiet = $_POST["Chitiet"];
                $Sodt = $_POST["Sodt"];
                $tienIch = $_POST["tienIch"];
                $query = "INSERT INTO `room`(`loaitinid`, `loaiphongid`, `giaphong`, `dientich`, `DiaChi`, `Tieude`, `Chitiet`, `Sodt`, `tienIch`) VALUES ($loaitinid,$loaiphongid, $giaphong,$dientich,\"$DiaChi\",\"$Tieude\",\"$Chitiet\", \"$Sodt\",\"$tienIch\")";
                $queryDB = mysqli_query($conn, $query);
                $query = "SELECT * FROM `room`";
                $queryDB = mysqli_query($conn, $query);
                $data = mysqli_fetch_all($queryDB, MYSQLI_ASSOC);
                echo json_encode($data);
                break;
        }
        break;
}
