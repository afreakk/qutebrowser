# vim: ft=cucumber fileencoding=utf-8 sts=4 sw=4 et:

Feature: Notifications
    HTML5 notification API interaction

    Background:
        Given I have a fresh instance
        And I open data/prompt/notifications.html
        And I set content.notifications to true
        And I run :click-element id button

    @qtwebengine_notifications
    Scenario: Notification is shown
        When I run :click-element id show-button
        Then the javascript message "notification shown" should be logged
        And a notification with id 1 is presented

    @qtwebengine_notifications @qtwebengine_py_5_15
    Scenario: User closes presented notification
        When I run :click-element id show-button
        And I close the notification with id 1
        Then the javascript message "notification closed" should be logged

    @qtwebengine_notifications @qtwebengine_py_5_15
    Scenario: User closes some other application's notification
        When I run :click-element id show-button
        And I close the notification with id 1234
        Then the javascript message "notification closed" should not be logged
