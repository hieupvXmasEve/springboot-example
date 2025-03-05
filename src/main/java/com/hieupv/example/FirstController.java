package com.hieupv.example;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
public class FirstController {

    @GetMapping("/")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public String sayHello() {
        return "Hello from my first controler";
    }

    @PostMapping("/")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public String sayHelloPost(
            @RequestBody String name
    ) {
        return "Hello from my first controler :" + name;
    }

}
