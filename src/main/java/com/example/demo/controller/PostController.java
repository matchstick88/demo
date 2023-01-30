package com.example.demo.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api")
public class PostController {

    //localhost:8080/api/postMethod
    @PostMapping("/postMethod")
    public String postMethod(@RequestBody SearchParam searchparam) {
        return "OK";
    }

    //localhost:8080/api/postMethod
    @PostMapping("/postMethod2")
    public SearchParam postMethod2(@RequestBody SearchParam searchparam) {
        return searchparam;
    }
}
