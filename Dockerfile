FROM norionomura/swiftlint:swift-5
LABEL version="3.2.1"
LABEL repository="https://github.com/norio-nomura/action-swiftlint"
LABEL homepage="https://github.com/norio-nomura/action-swiftlint"
LABEL maintainer="Petr Novoselov <novpeter@yandex.ru>"

LABEL "com.github.actions.name"="GitHub Action for SwiftLint"
LABEL "com.github.actions.description"="A tool to enforce Swift style and conventions."
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="yellow"

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
