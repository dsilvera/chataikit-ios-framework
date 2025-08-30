# ChatAIKit iOS SDK

[🌐 Visit ChatAIKit](https://www.chataikit.com)

ChatAIKit provides a simple and fast way to integrate AI-powered chatbots in your iOS apps. Manage bots, start chats, and track analytics in a few lines of code.

---

## Table of Contents

- [Installation](#installation)
- [Initialization](#initialization)
- [Analytics](#analytics)
- [Bot Documentation](#bot-documentation)
- [Start Chat](#start-chat)

---

## Installation

Follow these steps to add ChatAIKit to your project:

1. Add the ChatAIKit package to your project using Swift Package Manager.
2. Import `ChatAIKit` in your Swift files.
3. Initialize the SDK with your API key.

Example:

```swift
ChatAI.shared.initAsync(apiKey: apiKey) { result in
    switch result {
    case .success(let bots):
        for bot in bots {
            print("Bot available: \(bot.name)")
        }
    case .failure(let err):
        print("Error: \(err.message)")
    @unknown default:
        fatalError()
    }
}
```

You can also see step-by-step installation screenshots on [ChatAIKit Docs](https://www.chataikit.com/docs).

---

## Initialization

```swift
ChatAI.shared.initAsync(apiKey: apiKey) { result in
    // handle initialization result
}
```

---

## Analytics

ChatAIKit provides analytics hooks to track SDK events:

```swift
ChatAI.shared.setAnalyticsListener(MyAnalyticsListener())

class MyAnalyticsListener: ChatAIAnalyticsListener {
    func onSdkInitialized(success: Bool, botsCount: Int, error: Error?) {
        if success {
            print("✅ SDK initialized with \(botsCount) bots")
        } else {
            print("❌ SDK failed to initialize: \(error?.localizedDescription ?? "Unknown error")")
        }
    }

    func onBotFetched(bot: Bot) {
        print("🤖 Bot fetched: \(bot.name)")
    }

    func onChatStarted(bot: Bot) {
        print("💬 Chat started with bot: \(bot.name)")
    }

    func onMessageSent(bot: Bot, message: String) {
        print("📤 Sent to \(bot.name): \(message)")
    }

    func onMessageReceived(bot: Bot, message: String) {
        print("📥 Received from \(bot.name): \(message)")
    }

    func onError(bot: Bot?, error: Error) {
        print("⚠️ Error on \(bot?.name ?? "Unknown bot"): \(error.localizedDescription)")
    }
}
```

### Analytics Events

| Event | Description |
|-------|------------|
| `onSdkInitialized` | SDK initialization result |
| `onBotFetched` | Bot fetched from server |
| `onChatStarted` | Chat started with bot |
| `onMessageSent` | Message sent to bot |
| `onMessageReceived` | Message received from bot |
| `onError` | Any error in SDK or bot |

---

## Bot Documentation

A bot object contains the following properties:

| Property | Type | Description |
|----------|------|-------------|
| id | String | Unique bot identifier |
| botId | String | Bot ID exposed to user |
| name | String | Bot name |
| description | String? | Bot description |
| createdAt | String | Creation timestamp |
| profileId | String | Owner profile ID |
| welcomeMessage | Dictionary<String, String?>? | Optional welcome message |
| icon | String? | URL to bot icon |
| language | String? | Bot language code |
| tones | [String]? | List of tones |
| specializations | [String]? | List of bot specializations |
| responseLength | String? | Preferred response length |
| openaiModel | String? | OpenAI model used |
| useSendIcon | Bool | Whether to use send icon instead of text |
| backgroundLight | String? | Light mode background color |
| backgroundDark | String? | Dark mode background color |
| headerTextLight | String? | Light mode header text color |
| headerTextDark | String? | Dark mode header text color |
| botBubbleLight | String? | Light mode bot bubble color |
| botBubbleDark | String? | Dark mode bot bubble color |
| userBubbleLight | String? | Light mode user bubble color |
| userBubbleDark | String? | Dark mode user bubble color |
| buttonBackgroundLight | String? | Light mode button background color |
| buttonBackgroundDark | String? | Dark mode button background color |
| buttonTextLight | String? | Light mode button text color |
| buttonTextDark | String? | Dark mode button text color |

> 🔗 You can manage and edit your bots via the [ChatAIKit Dashboard](https://www.chataikit.com).

---

## Start Chat

### With Back Button

```swift
ChatAI.shared.chatView(for: bot, backView: {
    Button(action: { selectedBot = nil }) {
        Image(systemName: "chevron.left")
    }
})
```

### Without Back Button

```swift
ChatAI.shared.chatView(for: bot, backView: {
    EmptyView()
})
```

---

For more details, examples, and screenshots, visit [www.chataikit.com](https://www.chataikit.com)