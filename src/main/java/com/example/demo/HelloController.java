package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/hello")
    public String hello() {
        return "Hello from Spring in Docker 👋";
    }

    @GetMapping("/version")
    public String version() {
        // petite valeur par défaut (on changera à chaque release)
        String v = System.getenv().getOrDefault("APP_VERSION", "1.2");
        return "Demo Spring – version " + v;
    }
}
