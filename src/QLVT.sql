CREATE DATABASE QLVT;

USE QLVT;
-- Vật tư (id, mã vật tư, tên vật tư, đơn vị tính, giá tiền)
CREATE TABLE VatTu (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       ma_vat_tu VARCHAR(255),
                       ten_vat_tu VARCHAR(255),
                       don_vi_tinh VARCHAR(255),
                       gia_tien INT
);

-- Tồn kho (id, vật tư_id, số lượng đầu, tổng số lượng nhập, tổng số lượng xuất)
CREATE TABLE TonKho (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        vat_tu_id INT,
                        so_luong_dau INT,
                        tong_so_luong_nhap INT,
                        tong_so_luong_xuat INT,
                        FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Nhà Cung cấp (id, mã nhà cung cấp, tên nhà cung cấp, địa chỉ, số điện thoại)
CREATE TABLE NhaCungCap (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            ma_nha_cung_cap VARCHAR(255),
                            ten_nha_cung_cap VARCHAR(255),
                            dia_chi VARCHAR(255),
                            so_dien_thoai VARCHAR(20)
);

-- Đơn đặt hàng (id, mã đơn, ngày đặt hàng, nhà cung cấp_id)
CREATE TABLE DonDatHang (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            ma_don VARCHAR(255),
                            ngay_dat_hang DATE,
                            nha_cung_cap_id INT,
                            FOREIGN KEY (nha_cung_cap_id) REFERENCES NhaCungCap(id)
);

-- Phiếu nhập (id, mã phiếu nhập, ngày nhập, đơn hàng_id)
CREATE TABLE PhieuNhap (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           ma_phieu_nhap VARCHAR(255),
                           ngay_nhap DATE,
                           don_hang_id INT,
                           FOREIGN KEY (don_hang_id) REFERENCES DonDatHang(id)
);

-- Phiếu xuất (id, mã phiếu xuất, ngày xuất, tên khách hàng)
CREATE TABLE PhieuXuat (
                           id INT AUTO_INCREMENT PRIMARY KEY,
                           ma_phieu_xuat VARCHAR(255),
                           ngay_xuat DATE,
                           ten_khach_hang VARCHAR(255)
);

-- Chi tiết Đơn hàng (id, đơn hàng _id, vật tư_id, số lượng đặt)
CREATE TABLE ChiTietDonHang (
                                id INT AUTO_INCREMENT PRIMARY KEY,
                                don_hang_id INT,
                                vat_tu_id INT,
                                so_luong_dat INT,
                                FOREIGN KEY (don_hang_id) REFERENCES DonDatHang(id),
                                FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Chi tiết Phiếu nhập (id, phiếu nhập_id, vật tư_id, số lượng nhập, đơn giá nhập, ghi chú)
CREATE TABLE ChiTietPhieuNhap (
                                  id INT AUTO_INCREMENT PRIMARY KEY,
                                  phieu_nhap_id INT,
                                  vat_tu_id INT,
                                  so_luong_nhap INT,
                                  don_gia_nhap DECIMAL(10,2),
                                  ghi_chu VARCHAR(255),
                                  FOREIGN KEY (phieu_nhap_id) REFERENCES PhieuNhap(id),
                                  FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Chi tiết Phiếu xuất (id, phiếu xuất_id, vật tư_id, số lượng xuất, đơn giá xuất, ghi chú)
CREATE TABLE ChiTietPhieuXuat (
                                  id INT AUTO_INCREMENT PRIMARY KEY,
                                  phieu_xuat_id INT,
                                  vat_tu_id INT,
                                  so_luong_xuat INT,
                                  don_gia_xuat DECIMAL(10,2),
                                  ghi_chu VARCHAR(255),
                                  FOREIGN KEY (phieu_xuat_id) REFERENCES PhieuXuat(id),
                                  FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Nhập 5 bản ghi bảng Vật tư
-- Vật tư (id, mã vật tư, tên vật tư, đơn vị tính, giá tiền)
INSERT INTO Vattu values (1,'VT1', 'Vật tư 1', 'Cái', 10);
INSERT INTO Vattu values (2,'VT2', 'Vật tư 2', 'Hộp', 100);
INSERT INTO Vattu values (3,'VT3', 'Vật tư 3', 'Cái', 15);
INSERT INTO Vattu values (4,'VT4', 'Vật tư 4', 'Hộp', 200);
INSERT INTO Vattu values (5,'VT5', 'Vật tư 5', 'Cái', 50);
select * from Vattu;

-- Nhập 5 bản ghi bảng Tồn kho
-- Tồn kho (id, vật tư_id, số lượng đầu, tổng số lượng nhập, tổng số lượng xuất)
INSERT INTO TonKho values (1,1, 10, 100, 10);
INSERT INTO TonKho values (2,2, 10, 100, 10);
INSERT INTO TonKho values (3,3, 50, 100, 50);
INSERT INTO TonKho values (4,4, 70, 100, 20);
INSERT INTO TonKho values (5,5, 40, 100, 90);

-- Nhập 3 nhà cung cấp
-- Nhà Cung cấp (id, mã nhà cung cấp, tên nhà cung cấp, địa chỉ, số điện thoại)
INSERT INTO NhaCungCap values (1,'NCC1', 'Philips', 'Ha Noi', '097777777');
INSERT INTO NhaCungCap values (2,'NCC2', 'Sony', 'TP HCM', '098888888');
INSERT INTO NhaCungCap values (3,'NCC3', 'Samsung', 'Da Nang', '0912345678');

-- Nhập 3 đơn đặt hàng
-- Đơn đặt hàng (id, mã đơn, ngày đặt hàng, nhà cung cấp_id)
INSERT INTO DonDatHang values (1,'DDH1', '2023-12-01', 1);
INSERT INTO DonDatHang values (2,'DDH2', '2023-10-01', 2);
INSERT INTO DonDatHang values (3,'DDH3', '2023-05-01', 3);


-- Nhập 3 phiếu nhập
-- Phiếu nhập (id, mã phiếu nhập, ngày nhập, đơn hàng_id)
INSERT INTO PhieuNhap VALUES (1,'PN1', '2023-12-10', 1);
INSERT INTO PhieuNhap VALUES (2,'PN2', '2023-10-20', 2);
INSERT INTO PhieuNhap VALUES (3,'PN3', '2023-05-15', 3);

-- Nhập 3 phiếu xuất
-- Phiếu xuất (id, mã phiếu xuất, ngày xuất, tên khách hàng)
INSERT INTO PhieuXuat VALUES (1,'PX1', '2023-12-20', 'Loc');
INSERT INTO PhieuXuat VALUES (2,'PX2', '2023-10-25', 'Thong');
INSERT INTO PhieuXuat VALUES (3,'PX3', '2023-05-20', 'Phong');


-- Nhập 6 CT Đơn hàng
-- Chi tiết Đơn hàng (id, đơn hàng _id, vật tư_id, số lượng đặt)
INSERT INTO ChiTietDonHang VALUES (1, 1, 1, 20);
INSERT INTO ChiTietDonHang VALUES (2, 2, 2, 10);
INSERT INTO ChiTietDonHang VALUES (3, 3, 3, 30);
INSERT INTO ChiTietDonHang VALUES (4, 1, 4, 40);
INSERT INTO ChiTietDonHang VALUES (5, 2, 5, 30);
INSERT INTO ChiTietDonHang VALUES (6, 3, 1, 50);

-- Nhập 6 CT Phiếu nhập
-- Chi tiết Phiếu nhập (id, phiếu nhập_id, vật tư_id, số lượng nhập, đơn giá nhập, ghi chú)
INSERT INTO ChiTietPhieuNhap VALUES(1, 1, 1, 10, 8, 'Giá 10');
INSERT INTO ChiTietPhieuNhap VALUES(2, 2, 2, 20, 90, 'Giá 100');
INSERT INTO ChiTietPhieuNhap VALUES(3, 3, 3, 30, 10, 'Giá 15');
INSERT INTO ChiTietPhieuNhap VALUES(4, 1, 4, 40, 180, 'Giá 200');
INSERT INTO ChiTietPhieuNhap VALUES(5, 2, 5, 50, 40, 'Giá 50');
INSERT INTO ChiTietPhieuNhap VALUES(6, 3, 1, 60, 8, 'Giá 10');


-- Nhập 6 CT Phiếu xuất
-- Chi tiết Phiếu xuất (id, phiếu xuất_id, vật tư_id, số lượng xuất, đơn giá xuất, ghi chú)
INSERT INTO ChiTietPhieuXuat VALUES (1, 1, 1, 15, 10, 'Nhập 8');
INSERT INTO ChiTietPhieuXuat VALUES (2, 2, 2, 10, 100, 'Nhập 90');
INSERT INTO ChiTietPhieuXuat VALUES (3, 3, 3, 15, 15, 'Nhập 10');
INSERT INTO ChiTietPhieuXuat VALUES (4, 1, 4, 20, 200, 'Nhập 180');
INSERT INTO ChiTietPhieuXuat VALUES (5, 2, 5, 10, 50, 'Nhập 40');
INSERT INTO ChiTietPhieuXuat VALUES (6, 3, 1, 30, 10, 'Nhập 8');


-- Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP AS
SELECT
    CTPN.id AS so_phieu_nhap,
    VatTu.ma_vat_tu,
    CTPN.so_luong_nhap,
    CTPN.don_gia_nhap,
    CTPN.so_luong_nhap * CTPN.don_gia_nhap AS thanh_tien_nhap
FROM
    ChiTietPhieuNhap CTPN
        JOIN
    VatTu ON CTPN.vat_tu_id = VatTu.id;

SELECT * FROM vw_CTPNHAP;

-- Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau:
-- số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP_VT AS
SELECT
    CTPN.id AS so_phieu_nhap,
    VatTu.ma_vat_tu,
    VatTu.ten_vat_tu,
    CTPN.so_luong_nhap,
    CTPN.don_gia_nhap,
    CTPN.so_luong_nhap * CTPN.don_gia_nhap AS thanh_tien_nhap
FROM
    ChiTietPhieuNhap CTPN

        JOIN
    VatTu ON CTPN.vat_tu_id = VatTu.id;
SELECT * FROM vw_CTPNHAP_VT;

-- Câu 3: Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau:
-- số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP_VT_PN AS
SELECT
    PhieuNhap.id AS so_phieu_nhap,
    PhieuNhap.ngay_nhap,
    DonDatHang.ma_don,
    VatTu.ma_vat_tu,
    VatTu.ten_vat_tu,
    CTPN.so_luong_nhap,
    CTPN.don_gia_nhap,
    CTPN.so_luong_nhap * CTPN.don_gia_nhap AS thanh_tien_nhap
FROM
    ChiTietPhieuNhap CTPN
        JOIN
    PhieuNhap ON CTPN.phieu_nhap_id = PhieuNhap.id
        JOIN
    DonDatHang ON PhieuNhap.don_hang_id = DonDatHang.id
        JOIN
    VatTu ON CTPN.vat_tu_id = VatTu.id;
SELECT * FROM vw_CTPNHAP_VT_PN;

-- Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau:
-- số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
SELECT
    PhieuNhap.id AS so_phieu_nhap,
    PhieuNhap.ngay_nhap,
    DonDatHang.ma_don,
    NhaCungCap.ma_nha_cung_cap,
    VatTu.ma_vat_tu,
    VatTu.ten_vat_tu,
    CTPN.so_luong_nhap,
    CTPN.don_gia_nhap,
    CTPN.so_luong_nhap * CTPN.don_gia_nhap AS thanh_tien_nhap
FROM
    ChiTietPhieuNhap CTPN
        JOIN
    PhieuNhap ON CTPN.phieu_nhap_id = PhieuNhap.id
        JOIN
    DonDatHang ON PhieuNhap.don_hang_id = DonDatHang.id
        JOIN
    NhaCungCap ON DonDatHang.nha_cung_cap_id = NhaCungCap.id
        JOIN
    VatTu ON CTPN.vat_tu_id = VatTu.id;

SELECT * FROM vw_CTPNHAP_VT_PN_DH;

-- Câu 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau:
-- số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5.
CREATE VIEW vw_CTPNHAP_loc AS
SELECT
    CTPN.id AS so_phieu_nhap,
    VatTu.ma_vat_tu,
    CTPN.so_luong_nhap,
    CTPN.don_gia_nhap,
    CTPN.so_luong_nhap * CTPN.don_gia_nhap AS thanh_tien_nhap
FROM
    ChiTietPhieuNhap CTPN
        JOIN
    VatTu ON CTPN.vat_tu_id = VatTu.id
WHERE
    CTPN.so_luong_nhap > 5;

SELECT * FROM vw_CTPNHAP_loc;
-- Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau:
-- số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
-- Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.
CREATE VIEW vw_CTPNHAP_VT_loc AS
SELECT
    CTPN.id AS so_phieu_nhap,
    VatTu.ma_vat_tu,
    VatTu.ten_vat_tu,
    CTPN.so_luong_nhap,
    CTPN.don_gia_nhap,
    CTPN.so_luong_nhap * CTPN.don_gia_nhap AS thanh_tien_nhap
FROM
    ChiTietPhieuNhap CTPN
        JOIN
    VatTu ON CTPN.vat_tu_id = VatTu.id
WHERE
    VatTu.don_vi_tinh = 'Hộp';

SELECT * FROM vw_CTPNHAP_VT_loc;
DROP VIEW vw_CTPNHAP_VT_loc;

-- Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
CREATE VIEW vw_CTPXUAT AS
SELECT
    CTPX.id AS so_phieu_xuat,
    VatTu.ma_vat_tu,
    CTPX.so_luong_xuat,
    CTPX.don_gia_xuat,
    CTPX.so_luong_xuat * CTPX.don_gia_xuat AS thanh_tien_xuat
FROM
    ChiTietPhieuXuat CTPX
        JOIN
    VatTu ON CTPX.vat_tu_id = VatTu.id;

SELECT * FROM vw_CTPXUAT;
-- Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPXUAT_VT AS
SELECT
    CTPX.id AS so_phieu_xuat,
    VatTu.ma_vat_tu,
    VatTu.ten_vat_tu,
    CTPX.so_luong_xuat,
    CTPX.don_gia_xuat
FROM
    ChiTietPhieuXuat CTPX
        JOIN
    VatTu ON CTPX.vat_tu_id = VatTu.id;

SELECT * FROM vw_CTPXUAT_VT;
-- Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau:
-- số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPXUAT_VT_PX AS
SELECT
    CTPX.id AS so_phieu_xuat,
    PhieuXuat.ten_khach_hang,
    VatTu.ma_vat_tu,
    VatTu.ten_vat_tu,
    CTPX.so_luong_xuat,
    CTPX.don_gia_xuat
FROM
    ChiTietPhieuXuat CTPX
        JOIN
    PhieuXuat ON CTPX.phieu_xuat_id = PhieuXuat.id
        JOIN
    VatTu ON CTPX.vat_tu_id = VatTu.id;
SELECT * FROM vw_CTPXUAT_VT_PX;

-- Câu 1. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.
DELIMITER //

CREATE PROCEDURE GetTotalQuantity(IN MVT VARCHAR(255))
BEGIN
SELECT SUM(tk.tong_so_luong_nhap - tk.tong_so_luong_xuat) AS Total_Quantity
FROM TonKho tk
         JOIN VatTu ON tk.vat_tu_id = VatTu.id
WHERE VatTu.ma_vat_tu = MVT;
END //

DELIMITER ;

CALL GetTotalQuantity('VT1');
-- Câu 2. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào, out là tổng tiền xuất
DELIMITER //

CREATE PROCEDURE GetTotalAmountExported(IN MVT VARCHAR(255), OUT TotalAmountExported INT)
BEGIN
SELECT SUM(CTPX.so_luong_xuat * CTPX.don_gia_xuat) AS Total_mount
INTO TotalAmountExported
FROM ChiTietPhieuXuat CTPX
         JOIN VatTu ON CTPX.vat_tu_id = VatTu.id
WHERE VatTu.ma_vat_tu = MVT;
END //

DELIMITER ;

CALL GetTotalAmountExported('VT1', @TotalAmountExported);
SELECT @TotalAmountExported;

-- Câu 3. Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.
DELIMITER //

CREATE PROCEDURE GetTotalQuantityOrderedById(IN DHI INT, OUT TotalQuantityOrdered INT)
BEGIN
SELECT SUM(so_luong_dat) AS Total_Quantity
INTO TotalQuantityOrdered
FROM ChiTietDonHang
WHERE don_hang_id = DHI;
END //

DELIMITER ;


-- Câu 4. Tạo SP dùng để thêm một đơn đặt hàng.
DELIMITER //

CREATE PROCEDURE AddOrder(IN MD VARCHAR(255), IN NDH DATE, IN MNCC VARCHAR(255))
BEGIN
INSERT INTO DonDatHang (ma_don, ngay_dat_hang, nha_cung_cap_id)
VALUES (MD, NDH, (SELECT id FROM NhaCungCap WHERE ma_nha_cung_cap = MNCC));
END //

DELIMITER ;

CALL AddOrder('DDH4', '2023-12-23',1);
SELECT * FROM DonDatHang;


-- Câu 5. Tạo SP dùng để thêm một chi tiết đơn đặt hàng.
DELIMITER //

CREATE PROCEDURE AddOrderDetail(IN MD VARCHAR(255), IN MVT VARCHAR(255), IN SLD INT)
BEGIN
INSERT INTO ChiTietDonHang (don_hang_id, vat_tu_id, so_luong_dat)
VALUES ((SELECT id FROM DonDatHang WHERE ma_don = MD), (SELECT id FROM VatTu WHERE ma_vat_tu = MVT), SLD);
END //

DELIMITER ;

CALL AddOrderDetail(3,3, 70);
SELECT * FROM Chitietdonhang;
