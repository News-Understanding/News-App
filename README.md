# News Understanding App


## Overview

The News Understanding App is meticulously crafted to empower users in comprehending news articles from diverse sources. It goes beyond simple news consumption by offering a robust set of features. Users can analyze articles, view concise previews, and access well-crafted summaries. This enables them to make informed decisions about what to read, guided by their interests, sentiment preferences, and awareness of the author's bias.

## Features

### Article Classification

Users can input a news article into the app, triggering an in-depth analysis that covers five key classifications:

1. **Fake vs Real:** Distinguishes between authentic and potentially misleading articles.
2. **Sentiment Analysis:** Examines the sentiment expressed in the article, categorizing it as negative, positive, or neutral.
3. **Biased Detection:** Identifies the political bias of the author, classifying it as Left Biased, Right Biased, or Center.
4. **Topic Identification:** Categorizes the article into relevant topics.
5. **Summarization:** Generates a concise summary of the article for quick comprehension.

### Preview News Articles

Explore a curated feed of news articles, each tagged with pertinent information, including bias, sentiment, and topic. This intuitive feature allows users to swiftly identify articles that align with their preferences and values.

## Technologies Used

- **Flutter:** The app is built using the Flutter framework for a cross-platform experience.
- **Dart:** The programming language used in conjunction with Flutter.
- **Provider State Management:** Utilized to manage the state of the app and facilitate communication between the UI and API.
- **Dio:** Used for making HTTP requests from the Flutter app to the Flask API.

## Connecting Flutter and Flask
![Connection](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*O1imEbp9X8X6pzjf7bwfrw.png
)

To establish communication between Flutter and Flask, the app uses the Dio library for making HTTP requests. For more details on the backend implementation, please refer to the [Flask backend repository](link/to/flask_backend_repo).

## Screenshots

![App Screenshot 1](https://raw.githubusercontent.com/News-Understanding/News-App/main/assets/images/preview_news.jpg)
![App Screenshot 2](https://raw.githubusercontent.com/News-Understanding/News-App/main/assets/images/check_news_article.png)

## Getting Started

To get started with the app, follow these steps:

1. Clone the repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install dependencies.
4. Run the app using `flutter run`.

Feel free to contribute or report issues by creating a pull request or opening an issue.

