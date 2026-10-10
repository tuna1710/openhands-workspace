# 🤖 OpenHands AI Agent Workspace

Môi trường tự vận hành **AI Coding Agent** mã nguồn mở ([OpenHands](https://github.com/all-hands-ai/OpenHands)) trên nền tảng đám mây **GitHub Codespaces**.

Giải pháp self-hosted thay thế trực tiếp cho Devin hoặc Google Antigravity, cung cấp đầy đủ Linux sandbox, terminal tự động, trình duyệt tích hợp và công cụ chỉnh sửa tệp tin.

---

## 🚀 Khởi chạy nhanh (1-Click Launch)

Bấm vào nút dưới đây để khởi tạo ngay môi trường làm việc trên đám mây của bạn:

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/tuna1710/openhands-workspace)

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/tuna1710/openhands-workspace/blob/main/openhands_colab.ipynb)


---

## 📖 Hướng dẫn sử dụng từng bước

### Bước 1: Khởi động hệ thống
Sau khi giao diện Codespaces (VS Code trên trình duyệt) mở ra, mở Terminal (`Ctrl + ~`) và chạy lệnh duy nhất:

```bash
./start.sh
```

Hệ thống sẽ tự động cấu hình quyền Docker socket và khởi chạy OpenHands cùng Sandbox Linux trong nền.

### Bước 2: Truy cập Giao diện Web
1. Đợi khoảng **15 - 20 giây** sau khi chạy script.
2. Một thông báo pop-up sẽ hiện lên ở góc dưới bên phải: *"Your application running on port 3000 is available"*. Bấm **Open in Browser**.
3. *(Nếu không thấy thông báo)*: Nhìn xuống thanh công cụ dưới cùng, bấm tab **PORTS** ➔ Chuột phải vào cổng **3000** ➔ Chọn **Open in Browser**.
4. **Bảo mật:** Đảm bảo cột **Visibility** của cổng 3000 là **`Private`** (chỉ tài khoản GitHub của bạn mới có quyền truy cập, tránh lộ API Key).

---

## ⚙️ Cấu hình Mô hình AI (LLM Settings)

Khi màn hình OpenHands xuất hiện lần đầu (hoặc bấm biểu tượng ⚙️ **Settings** ➔ tab **LLM**):

### 1. Dùng Google Gemini (Khuyên dùng - Nhanh & Tiết kiệm)
* **LLM Provider**: Chọn `Gemini`
* Bật công tắc **Advanced options**
* **Custom Model**: 
  * `gemini/gemini-3.8-flash` *(Bản mới nhất, phản hồi cực nhanh, tối ưu cho tác vụ agent)*
  * Hoặc `gemini/gemini-3.1-pro-preview` *(Tư duy sâu, mạnh nhất cho bài toán kiến trúc phức tạp)*
* **API Key**: Lấy key miễn phí tại [Google AI Studio](https://aistudio.google.com/) và dán vào.
* Bấm **Save**.

### 2. Dùng các mô hình khác (Tùy chọn)
* **Anthropic Claude**: Chọn Provider `Anthropic` | Model: `claude-3-7-sonnet`
* **OpenAI**: Chọn Provider `OpenAI` | Model: `gpt-4o` hoặc `o3-mini`

---

## 💡 Gợi ý cách giao việc cho Agent (Prompts mẫu)

Sau khi cấu hình xong, bấm dấu **`+`** ở góc trái để tạo hội thoại mới và gõ lệnh:

* **Tạo ứng dụng Web hoàn chỉnh:**
  > *"Hãy tạo cho tôi một ứng dụng Game rắn săn mồi (Snake Game) phong cách Retro bằng HTML5 Canvas và CSS. Sau đó chạy một web server để tôi chơi thử."*
* **Viết script tự động hóa & cào dữ liệu:**
  > *"Hãy viết một đoạn script Python lấy tin tức công nghệ mới nhất từ VNExpress, tổng hợp thành báo cáo và lưu vào file summary.md."*
* **Sửa lỗi & Tái cấu trúc mã nguồn:**
  > *"Hãy kiểm tra toàn bộ thư mục dự án này, viết tài liệu API chi tiết và bổ sung Unit Test với coverage trên 80%."*

---

## 🛠️ Các lệnh quản trị hữu ích

| Thao tác | Lệnh trong Terminal Codespaces |
| :--- | :--- |
| **Kiểm tra trạng thái container** | `docker ps` |
| **Xem log hoạt động của Agent** | `docker logs -f openhands-app` |
| **Khởi động lại OpenHands** | `./start.sh` |
| **Dừng hoàn toàn OpenHands** | `docker rm -f openhands-app` |

---

## 💡 Mẹo tiết kiệm tài nguyên
* GitHub cấp **120 giờ máy ảo miễn phí mỗi tháng** cho tài khoản cá nhân.
* Khi không còn sử dụng, hãy vào [github.com/codespaces](https://github.com/codespaces), bấm dấu `...` ở Codespace của bạn và chọn **Stop Codespace** để tiết kiệm thời gian chạy.
