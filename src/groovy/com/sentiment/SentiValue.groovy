package com.sentiment

public enum SentiValue {

    NEUTRAL('NEUTRAL'),
    POSITIVE('POSITIVE'),
    NEGATIVE('NEGATIVE')

    String description

    SentiValue(String description) {
        this.description = description
    }
}