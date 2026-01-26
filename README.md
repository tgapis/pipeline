
# Telegram API Data & Documentation Pipeline

This repository powers the automated collection, normalization, and distribution of **Telegram API data** across the **tgapis** ecosystem.

It periodically fetches and regenerates structured artifacts derived from official Telegram sources — including **Bot API**, **MTProto**, **TDLib**, and **Telegram Desktop** — and publishes them to downstream repositories and documentation sites.

All updates are handled via a scheduled automation workflow, ensuring the data stays current, consistent, and reproducible.

---

## Telegram Bot API Web Client

A lightweight, browser-based client for interacting with the **Telegram Bot API**.

This project provides a simple web interface to execute Bot API methods, send messages, and inspect JSON responses directly from the browser, without requiring SDKs, backend servers, or local setup.

It is intended for testing, learning, and quick experimentation with the Telegram Bot API.

> This project is currently private and in a pre-release stage, while security reviews and improvements are ongoing.

---

## 📚 Telegram Docs Bots

Welcome 👋🏻  
This project provides **instant access to Telegram Bot API and Telethon (TL) API methods** using powerful inline Telegram bots. No more browsing docs again and again.. just search and get results instantly 🚀

---

## 🤖 @TdocsBot — Telegram Bot API Docs

Use **inline search** to quickly find any Telegram **Bot API** method.

### How to use

@TdocsBot <query>

Search anywhere in Telegram using inline mode.

### Example searches
- `sendMessage`
- `getUpdates`
- `editMessageText`

🔍 Fast • Simple • Inline

⚠️ This bot is **not affiliated with Telegram**  
Made by [Ankit](https://t.me/ankify) for personal use.

---

## 🤖 @TldocsBot — Telethon (TL) API Docs

Instant search for **Telethon raw API (TL-schema) methods** with flexible output formats.

### Inline usage

@TldocsBot <query>

### 🔑 Prefix Usage Guide

| Prefix | Result |
|------|------|
| `.query` | Import link only |
| `/query` | Import + parameters |
| `!query` | Import + example + link |
| `` `query `` | Example + link |
| `query` | Full method details |

### Example searches
- `SendMessageRequest`
- `DeleteChatRequest`
- `EditMessageRequest`

🎉 Created by **[Ankit Chaubey](https://github.com/ankit-chaubey)**  
Telegram contact: [@ankify](https://t.me/ankify)  
GitHub: [@ankit-chaubey](https://github.com/ankit-chaubey) 🧑🏻‍💻

---

## 🔄 Automatic Updates

This project is **fully automated**:

- Scrapes official Telegram & Telethon documentation
- Regenerates JSON schemas automatically
- Publishes updated docs regularly using CI workflows

No manual updates needed ✨

---

## 🌐 Published Resources

- **Bot API JSON**  
  👉 https://tgapis.github.io/x/botapi.min.json

- **Telethon TL Documentation**  
  👉 https://tgapis.github.io/x/Telegram/

- **Interactive TL-Schema Explorer**  
  👉 https://tgapis.github.io/schema.tl/

- **Telethon diff.telethon.dev Fork**
  - Desktop: https://tgapis.github.io/x/TL/diff/tdesktop.html  
  - TDLib: https://tgapis.github.io/x/TL/diff/tdlib.html

* **Telethon TL Documentation**  
  https://tgapis.github.io/x/Telegram/

* **Bot API Docs Explorer**  
  https://tgapis.github.io/botapidocs/

* **Interactive TL-Schema Explorer**  
  https://telegramplayground.github.io/schema.tl/

* **Telethon Diff (fork of diff.telethon.dev)**  
  * Telegram Desktop: https://tgapis.github.io/x/TL/diff/tdesktop.html  
  * TDLib: https://tgapis.github.io/x/TL/diff/tdlib.html  

---

## JSON Data

### GitHub Pages (IO format)

* **botapi.json**  
  https://tgapis.github.io/x/botapi.json  
  [↗](https://raw.githubusercontent.com/tgapis/x/data/botapi.json)

* **botapi.min.json**  
  https://tgapis.github.io/x/botapi.min.json  
  [↗](https://raw.githubusercontent.com/tgapis/x/data/botapi.min.json)

* **api.json**  
  https://tgapis.github.io/x/api.json  
  [↗](https://raw.githubusercontent.com/tgapis/x/data/api.json)

* **core.json**  
  https://tgapis.github.io/x/core.json  
  [↗](https://raw.githubusercontent.com/tgapis/x/data/core.json)

* **corefork.json**  
  https://tgapis.github.io/x/corefork.json  
  [↗](https://raw.githubusercontent.com/tgapis/x/data/corefork.json)

* **tdesktop.json**  
  https://tgapis.github.io/x/tdesktop.json  
  [↗](https://raw.githubusercontent.com/tgapis/x/data/tdesktop.json)

* **tdlib.json**  
  https://tgapis.github.io/x/tdlib.json  
  [↗](https://raw.githubusercontent.com/tgapis/x/data/tdlib.json)

* **blogfork.json**  
  https://tgapis.github.io/x/blogfork.json  
  [↗](https://raw.githubusercontent.com/tgapis/x/data/blogfork.json)

---

## TL Schemas

### Raw (canonical)

* **api.tl**  
  https://raw.githubusercontent.com/tgapis/x/data/api.tl

* **core.tl**  
  https://raw.githubusercontent.com/tgapis/x/data/core.tl

* **corefork.tl**  
  https://raw.githubusercontent.com/tgapis/x/data/corefork.tl

* **tdesktop.tl**  
  https://raw.githubusercontent.com/tgapis/x/data/tdesktop.tl

* **tdlib.tl**  
  https://raw.githubusercontent.com/tgapis/x/data/tdlib.tl

* **blogfork.tl**  
  https://raw.githubusercontent.com/tgapis/x/data/blogfork.tl

---

## ❤️ Notes

- Built for speed, clarity, and developer convenience
- Ideal for **bot developers**, **Telethon users**, and **Telegram power users**
- Open-source & continuously improving

Enjoy exploring Telegram APIs effortlessly 🚀

## 🙏 Thanks & Credits

Special thanks to **PaulSonOfLars** (@PaulSonOfLars) for the Telegram Bot API specification  
 - https://github.com/PaulSonOfLars/telegram-bot-api-spec

Big thanks to **SpEcHiDe** (@SpEcHiDe) for maintaining Telegram API resources  
 - https://github.com/TelegramPlayground/TG-APIs

Grateful to **Lonami** (@LonamiWebs) for Telethon and TL diff tools  
 - https://github.com/LonamiWebs/Telethon  
 - https://github.com/Lonami/tl-differ

---

**Maintainer**  
Ankit Chaubey  
GitHub: https://github.com/ankit-chaubey  

Part of the **tgapis** ecosystem.
