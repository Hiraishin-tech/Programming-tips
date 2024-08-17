<?php

function redirectURL ($url) {
    return header("Location: $url");
}