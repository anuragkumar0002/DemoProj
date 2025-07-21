package com.streaming.Component;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    @GetMapping("/msg")
    public String getMessage() {
        return " Welcome to Demo";
    }
}
