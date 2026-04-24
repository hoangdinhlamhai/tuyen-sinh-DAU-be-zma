-- ============================================================
-- RE-SEED: Chỉ cập nhật bảng majors + tarot_card
-- KHÔNG ảnh hưởng bất kỳ bảng nào khác
-- ============================================================

BEGIN;

-- 1. Xóa majors cũ (kiến trúc) và thêm majors mới (kinh tế)
-- Chỉ xóa các mã ngành kiến trúc cũ không còn dùng
DELETE FROM majors WHERE id IN ('7210403', '7220201', '7220204', '7480201', '7510301', '7580101', '7580108', '7580201', '7580205', '7580302', '7810201');

-- Thêm/cập nhật các ngành DUE mới
INSERT INTO majors (id, name, min_score, is_active, scholarship_group_id, created_at) VALUES
('7310101', 'Kinh tế', NULL, 1, 'GROUP_A', '2026-03-04T09:17:24.000Z'),
('7310106', 'Kinh tế quốc tế', NULL, 1, 'GROUP_A', '2026-03-04T09:17:24.000Z'),
('7340201', 'Tài chính - Ngân hàng', NULL, 1, 'GROUP_A', '2026-03-04T09:17:24.000Z'),
('7340301', 'Kế toán', NULL, 1, 'GROUP_A', '2026-03-04T09:17:24.000Z'),
('7340101', 'Quản trị kinh doanh', NULL, 1, 'GROUP_A', '2026-03-04T09:17:24.000Z'),
('7340120', 'Kinh doanh quốc tế', NULL, 1, 'GROUP_A', '2026-03-04T09:17:24.000Z'),
('7340115', 'Marketing', NULL, 1, 'GROUP_A', '2026-03-04T09:17:24.000Z'),
('7340122', 'Thương mại điện tử', NULL, 1, 'GROUP_A', '2026-03-04T09:17:24.000Z'),
('7510605', 'Logistics và quản lý chuỗi cung ứng', NULL, 1, 'GROUP_B', '2026-03-04T09:17:24.000Z'),
('7340405', 'Hệ thống thông tin quản lý', NULL, 1, 'GROUP_B', '2026-03-04T09:17:24.000Z'),
('7380107', 'Luật kinh tế', NULL, 1, 'GROUP_B', '2026-03-04T09:17:24.000Z'),
('7810103', 'Quản trị dịch vụ du lịch và lữ hành', NULL, 1, 'GROUP_B', '2026-03-04T09:17:24.000Z')
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name, scholarship_group_id = EXCLUDED.scholarship_group_id;

-- 2. Cập nhật tarot_card: chỉ update nội dung ngành + highlights, KHÔNG xóa bảng
UPDATE tarot_card SET
  suggested_majors = '["Kinh tế", "Quản trị kinh doanh", "Tài chính - Ngân hàng"]',
  university_highlights = '["Một cánh cửa mở ra tại DUE: Mạng lưới kết nối hơn 500 doanh nghiệp đối tác, đảm bảo 100% cơ hội thực tập và việc làm cho Sinh viên.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Cơ sở vật chất hiện đại, phòng thực hành chuyên sâu theo mô hình doanh nghiệp.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Đội ngũ giảng viên 100% là doanh nhân, chuyên gia đang thực chiến tại các tập đoàn."]'
WHERE name = 'THE MAGICIAN';

UPDATE tarot_card SET
  suggested_majors = '["Kinh tế quốc tế", "Marketing", "Luật kinh tế"]',
  university_highlights = '["Một cánh cửa mở ra tại DUE: Chương trình đào tạo chú trọng thực tiễn, định hướng ứng dụng công nghệ 4.0 (AI, Fintech, Big Data).", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Không gian học tập hiện đại với các phòng thực hành công nghệ tiên tiến.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Sinh viên được trải nghiệm dự án thực tế từ năm 2, cùng làm việc với doanh nghiệp hàng đầu."]'
WHERE name = 'HIGH PRIESTESS';

UPDATE tarot_card SET
  suggested_majors = '["Tài chính - Ngân hàng", "Kinh tế", "Quản trị kinh doanh"]',
  university_highlights = '["Một cánh cửa mở ra tại DUE: Học bổng lên đến 100% học phí cho sinh viên xuất sắc, đảm bảo tương lai tài chính vững vàng.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Chương trình liên kết quốc tế với các trường đại học Nhật Bản, Hàn Quốc, Singapore.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: 97% sinh viên có việc làm trong 6 tháng sau tốt nghiệp."]'
WHERE name = 'THE EMPRESS';

UPDATE tarot_card SET
  suggested_majors = '["Quản trị kinh doanh", "Kinh tế", "Luật kinh tế"]',
  university_highlights = '["Một cánh cửa mở ra tại DUE: Đào tạo cử nhân có năng lực lãnh đạo, quản lý dự án quy mô lớn.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Chương trình Quản trị kinh doanh chuẩn quốc tế AACSB.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Mạng lưới cựu sinh viên giữ vị trí lãnh đạo tại các doanh nghiệp lớn."]'
WHERE name = 'THE EMPEROR';

UPDATE tarot_card SET
  suggested_majors = '["Marketing", "Kinh tế quốc tế", "Kinh doanh quốc tế"]',
  university_highlights = '["Một cánh cửa mở ra tại DUE: Không gian đại học xanh, hiện đại ngay giữa lòng thành phố Đà Nẵng đáng sống.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Môi trường học tập cởi mở, khuyến khích sáng tạo và phát triển cá nhân.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Hoạt động ngoại khóa phong phú, câu lạc bộ doanh nghiệp đa dạng."]'
WHERE name = 'THE LOVER';

UPDATE tarot_card SET
  suggested_majors = '["Kinh tế", "Tài chính - Ngân hàng", "Quản trị kinh doanh"]',
  university_highlights = '["Một cánh cửa mở ra tại DUE: Sinh viên DUE liên tục đạt giải thưởng quốc gia và quốc tế về nghiên cứu kinh tế.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Chương trình mentorship 1-1 với các doanh nhân, chuyên gia tài chính nổi tiếng.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Cơ hội tham gia hội thảo quốc tế ngay từ khi còn là sinh viên."]'
WHERE name = 'THE STAR';

UPDATE tarot_card SET
  suggested_majors = '["Marketing", "Kinh tế số", "Thương mại điện tử"]',
  university_highlights = '["Một cánh cửa mở ra tại DUE: Chương trình đào tạo đa ngành, cho phép sinh viên tự do khám phá đam mê.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Phòng thực hành hiện đại với trang thiết bị chuẩn công nghiệp.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Kết nối trực tiếp với thị trường lao động qua hệ thống doanh nghiệp đối tác."]'
WHERE name = 'THE SUN';

UPDATE tarot_card SET
  suggested_majors = '["Kinh tế quốc tế", "Quản trị kinh doanh", "Tài chính - Ngân hàng"]',
  university_highlights = '["Một cánh cửa mở ra tại DUE: Chương trình trao đổi sinh viên quốc tế, mở rộng tầm nhìn toàn cầu.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Đạt chuẩn quốc gia về kiểm định chất lượng giáo dục.", "Năng lượng của thẻ bài phản chiếu điểm mạnh này: Chương trình đào tạo tích hợp công nghệ 4.0 (AI, Fintech, Big Data)."]'
WHERE name = 'THE WORLD';

COMMIT;
