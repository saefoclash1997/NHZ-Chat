# 🚀 NHZ CHAT

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter\&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase\&logoColor=black)
![Provider](https://img.shields.io/badge/State%20Management-Provider-blue)
![License](https://img.shields.io/badge/License-MIT-green)

**تطبيق غروب شات - New Horizons (معهد نيو هورايزن)** - New Horizons (معهد نيو هورايزن)**

تطبيق تعليمي مبني بـ **Flutter** كجزء من منهج معهد نيو هورايزن لتعليم تطوير تطبيقات Flutter. الهدف من المشروع هو تعليم الطلاب كيفية بناء تطبيق دردشة جماعي (Group Chat) مع خواص أساسية مثل التسجيل، القنوات، الرسائل النصية، وإظهار المشاركين.

---

## ✨ الميزات

* 🔐 تسجيل دخول وتسجيل مستخدم
* 💬 غرف دردشة
* 🕒 عرض الطابع الزمني للرسائل
* 🧭 هيكلية واضحة لتعليم الطلاب ( Provider )

---

## 🧩 التقنيات المستخدمة

* Flutter (Dart)
* Firebase (Authentication, Firestore, Storage) 
* Provider
* GitHub

---

## ⚙️ المتطلبات

* Flutter SDK (الإصدار المناسب — عادة آخر إصدار مستقر)
* Android Studio أو VS Code + محاكي/جهاز حقيقي
* حساب Firebase

---

## 🔧 إعداد Firebase (مثال)

1. أنشئ مشروع Firebase وفعّل Authentication (Email) و Firestore و Storage.
2. حمّل ملفات `google-services.json` (Android) و/أو `GoogleService-Info.plist` (iOS) وضعها في المسارات المناسبة.
3. تأكد من تهيئة Firebase في `main.dart` قبل `runApp()`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```

---

## 🧭 نصائح للطلاب

* ابدأ بوضع تصميم واجهات بسيطة ثم ربطها بالخدمات تدريجيًا.
* افصل منطق الأعمال (business logic) عن واجهة المستخدم.
* استخدم Git بكثرة: commits صغيرة وواضحة.
* اكتب README واضح قبل رفع المشروع على GitHub.

---