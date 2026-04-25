-- =====================================
-- PROGRAM LENGKAP PRAKTIKUM MYSQL
-- =====================================

-- ========================
-- BAGIAN A
-- ========================
DROP PROCEDURE IF EXISTS bagian_a;
DELIMITER $$

CREATE PROCEDURE bagian_a()
BEGIN
    SELECT CONCAT(
        'Mahasiswa Destrina (2411043) dari Program Studi Informatika ',
        'terdaftar di Universitas Mega Buana Palopo pada semester 4.'
    ) AS output_mahasiswa

    UNION ALL

    SELECT CONCAT(
        'Mahasiswa Ayu (2411036) dari Program Studi Sistem Informasi ',
        'terdaftar di Universitas Mega Buana Palopo pada semester 2.'
    )

    UNION ALL

    SELECT CONCAT(
        'Mahasiswa Siti Aisyah (2411026) dari Program Studi Teknik Komputer ',
        'terdaftar di Universitas Mega Buana Palopo pada semester 6.'
    );
END $$

DELIMITER ;

-- ========================
-- BAGIAN B
-- ========================
DROP PROCEDURE IF EXISTS bagian_b;
DELIMITER $$

CREATE PROCEDURE bagian_b()
BEGIN
    SELECT 
        'Destrina' AS nama,
        '2411043' AS nim,
        IF('LUNAS'='LUNAS' AND 4>0 AND 15>0,'Valid','Tidak Valid') AS status_data,
        CASE 
            WHEN 15 BETWEEN 1 AND 12 THEN 'Ringan'
            WHEN 15 BETWEEN 13 AND 18 THEN 'Sedang'
            WHEN 15 BETWEEN 19 AND 24 THEN 'Padat'
        END AS beban_studi,
        CASE 
            WHEN 3.20 >= 3.50 THEN 'Sangat Baik'
            WHEN 3.20 >= 3.00 THEN 'Baik'
            WHEN 3.20 >= 2.50 THEN 'Cukup'
            ELSE 'Perlu Pembinaan'
        END AS performa_akademik

    UNION ALL

    SELECT 
        'Ayu',
        '2411036',
        IF('BELUM'='LUNAS','Valid','Tidak Valid'),
        CASE 
            WHEN 12 BETWEEN 1 AND 12 THEN 'Ringan'
            WHEN 12 BETWEEN 13 AND 18 THEN 'Sedang'
            WHEN 12 BETWEEN 19 AND 24 THEN 'Padat'
        END,
        CASE 
            WHEN 2.80 >= 3.50 THEN 'Sangat Baik'
            WHEN 2.80 >= 3.00 THEN 'Baik'
            WHEN 2.80 >= 2.50 THEN 'Cukup'
            ELSE 'Perlu Pembinaan'
        END;
END $$

DELIMITER ;

-- ========================
-- BAGIAN C
-- ========================
DROP PROCEDURE IF EXISTS bagian_c;
DELIMITER $$

CREATE PROCEDURE bagian_c()
BEGIN
    SELECT 
        'Destrina' AS nama,
        '2411043' AS nim,
        IF('LUNAS'='LUNAS' AND 4>0 AND 15>0,'Layak','Tidak Layak') AS kelayakan_krs,
        CASE 
            WHEN 15 BETWEEN 1 AND 12 THEN 'Ringan'
            WHEN 15 BETWEEN 13 AND 18 THEN 'Sedang'
            WHEN 15 BETWEEN 19 AND 24 THEN 'Padat'
        END AS beban_studi,
        CASE 
            WHEN 3.20 >= 3.50 THEN 'Sangat Baik'
            WHEN 3.20 >= 3.00 THEN 'Baik'
            WHEN 3.20 >= 2.50 THEN 'Cukup'
            ELSE 'Perlu Pembinaan'
        END AS performa_akademik,
        'Semua syarat terpenuhi' AS alasan

    UNION ALL

    SELECT 
        'Ayu',
        '2411036',
        IF('BELUM'='LUNAS','Layak','Tidak Layak'),
        CASE 
            WHEN 12 BETWEEN 1 AND 12 THEN 'Ringan'
            WHEN 12 BETWEEN 13 AND 18 THEN 'Sedang'
            WHEN 12 BETWEEN 19 AND 24 THEN 'Padat'
        END,
        CASE 
            WHEN 2.80 >= 3.50 THEN 'Sangat Baik'
            WHEN 2.80 >= 3.00 THEN 'Baik'
            WHEN 2.80 >= 2.50 THEN 'Cukup'
            ELSE 'Perlu Pembinaan'
        END,
        'Pembayaran belum lunas';
END $$

DELIMITER ;

-- ========================
-- BAGIAN D (PERBANDINGAN)
-- ========================
DROP PROCEDURE IF EXISTS banding_mahasiswa;
DELIMITER $$

CREATE PROCEDURE banding_mahasiswa()
BEGIN
    DECLARE nama1 VARCHAR(50) DEFAULT 'Destrina';
    DECLARE nim1 VARCHAR(20) DEFAULT '2411043';
    DECLARE semester1 INT DEFAULT 4;
    DECLARE sks1 INT DEFAULT 80;
    DECLARE ipk1 DECIMAL(3,2) DEFAULT 3.75;

    DECLARE nama2 VARCHAR(50) DEFAULT 'Ayu';
    DECLARE nim2 VARCHAR(20) DEFAULT '2411036';
    DECLARE semester2 INT DEFAULT 4;
    DECLARE sks2 INT DEFAULT 78;
    DECLARE ipk2 DECIMAL(3,2) DEFAULT 3.75;

    DECLARE hasil VARCHAR(150);

    IF ipk1 > ipk2 THEN
        SET hasil = CONCAT('Mahasiswa ', nama1, ' lebih unggul dari ', nama2);
    ELSEIF ipk2 > ipk1 THEN
        SET hasil = CONCAT('Mahasiswa ', nama2, ' lebih unggul dari ', nama1);
    ELSE
        IF sks1 > sks2 THEN
            SET hasil = CONCAT('Mahasiswa ', nama1, ' lebih unggul dari ', nama2);
        ELSEIF sks2 > sks1 THEN
            SET hasil = CONCAT('Mahasiswa ', nama2, ' lebih unggul dari ', nama1);
        ELSE
            SET hasil = 'Kedua mahasiswa setara';
        END IF;
    END IF;

    SELECT 
        'Mahasiswa A' AS kategori,
        nama1 AS nama,
        nim1 AS nim,
        semester1 AS semester,
        sks1 AS sks,
        ipk1 AS ipk

    UNION ALL

    SELECT 
        'Mahasiswa B',
        nama2,
        nim2,
        semester2,
        sks2,
        ipk2;

    SELECT hasil AS kesimpulan;
END $$

DELIMITER ;