# texpense

Ứng dụng quản lý chi tiêu cá nhân

# figma

Link: https://www.figma.com/design/1WsvH27Iy0s3fk9K3yhxVp/Kitty---Expense-Management-(Community)-(Copy)?m=auto&t=qzUY6slU2uowkeUS-6

# Setup firebase

## 1. Cài Node

Cài Node để có thể dùng lệnh `npm`

```
brew install node
```

## 2. Cài firebase-tools

Cài firebase-tools để có thể sử dụng lệnh `firebase` 
```
npm install -g firebase-tools
```

## 3. Flutter Firebase Init

Dùng cụm lệnh này để có thể sử dụng flutterfire cũng như setup Firebase trong trường hợp 
config lần đầu hoặc config lại sau khi enabled một số dịch vụ mới qua firebase console

```
dart pub global activate flutterfire_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"
flutterfire configure --project=texpense-4665f
```

Sử dụng lệnh dưới để có thể lấy project id
```
firebase projects:list
```

## 4. Firebase emulators

Sử dụng lệnh `firebase init emulators` để khởi tạo các chức năng

Sử dụng lệnh `firebase emulators:start` để khởi động tất cả các dịch vụ

Nếu chỉ muốn khỏi động các dịch vụ đơn lẻ thì dùng lệnh
```
firebase emulators:start --only <emulators>
```

> **_NOTE:_** only specific emulators. This is a comma separated list of emulator names. Valid options are: ["auth","functions","firestore","database","hosting","pubsub","storage","eventarc","dataconnect","tasks"]

## 5. Xử lý lỗi thường gặp

### Thi thoảng nếu như lần đầu setup firebase lên project thì sẽ sinh ra một số lỗi liên quan đến pod
- Chạy lệnh `pod install && pod update`
- Chạy project bằng terminal `flutter run`
- Từ những lần sau mọi thứ sẽ chạy bình thường

