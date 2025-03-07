## Giải thích ứng dụng của từng thành phần:

### 1. Student.java (Entity):

- Mục đích: Đại diện cho bảng "students" trong database.
- Ứng dụng:
    - Định nghĩa cấu trúc dữ liệu (các field như id, firstName, lastName, email).
    - Sử dụng JPA annotations (@Entity, @Id, @GeneratedValue) để ánh xạ với database.
- Lưu ý: Đây là nơi lưu trữ dữ liệu thực tế trong hệ thống.

### 2. StudentDto.java (Data Transfer Object):

- Mục đích: Dùng để truyền dữ liệu giữa các layer, đặc biệt là từ Controller tới client.
- Ứng dụng:
    - Ngăn chặn việc expose toàn bộ Entity ra ngoài.
    - Có thể tùy chỉnh các field để phù hợp với API response.
- Lưu ý: Không liên kết trực tiếp với database, chỉ là lớp trung gian.

### 3. StudentRepository.java (JPA Repository):

- Mục đích: Giao tiếp với database thông qua Spring Data JPA.
- Ứng dụng:
    - Cung cấp các method CRUD cơ bản (findAll, findById, save, deleteById).
    - Có thể mở rộng để thêm các query tùy chỉnh nếu cần.
- Lưu ý: Không cần viết code implementation, Spring sẽ tự sinh ra.

### 4. StudentMapper.java (Mapper):

- Mục đích: Chuyển đổi giữa Entity (Student) và DTO (StudentDto).
- Ứng dụng:
    - Sử dụng MapStruct để tự động ánh xạ các field tương ứng.
    - Giảm thiểu code boilerplate khi chuyển đổi dữ liệu.
- Lưu ý: Cần khai báo dependency MapStruct trong pom.xml.

### 5. StudentService.java (Service Layer):

- Mục đích: Xử lý logic nghiệp vụ của ứng dụng.
- Ứng dụng:
    - Gọi Repository để truy vấn database.
    - Sử dụng Mapper để chuyển đổi dữ liệu.
    - Xử lý exception và logic phức tạp nếu có.
- Lưu ý: Đây là nơi tập trung logic chính, giữ Controller gọn nhẹ.

### 6. StudentController.java (REST Controller):

- Mục đích: Định nghĩa các endpoint RESTful để giao tiếp với client.
- Ứng dụng:
    - Nhận request từ client (GET, POST, DELETE).
    - Gọi Service để xử lý và trả về response.
- Lưu ý: Chỉ nên chứa logic điều hướng, không xử lý nghiệp vụ.

### 7. Flow hoạt động:

1. Client gửi request (ví dụ: GET /api/students) → Controller.
2. Controller gọi phương thức tương ứng trong Service.
3. Service sử dụng Repository để truy vấn database và Mapper để chuyển đổi dữ liệu.
4. Dữ liệu được trả về dưới dạng DTO qua Controller tới client.