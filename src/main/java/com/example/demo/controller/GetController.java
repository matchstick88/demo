package com.example.demo.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class GetController {
    //localhost:8080/api/getMethod
    @RequestMapping(method= RequestMethod.GET, path="/getMethod")
    public String getRequest() {
        return "Hi getMethod";
    }

    //http://localhost:8080/api/getParameter?id=1234&password=abcd
    @GetMapping("/getParameter")
    public String getParameter(@RequestParam String id, @RequestParam(name="password") String pwd) {
        String password = "qwerty";
        System.out.println("id:" + id);
        System.out.println("password: " + pwd);

        return id+pwd;
    }

    //String 값으로 리턴
    //http://localhost:8080/api/getMultiParameter?account=abcd&email=study@gmail.com&page=10
    @GetMapping("/getMultiParameter")
    public String getMultiParameter(SearchParam searchParam){
        System.out.println(searchParam.getAccount());
        System.out.println(searchParam.getEmail());
        System.out.println(searchParam.getPage());

        return "OK";
    }

    //JSON 값으로 리턴.
    //http://localhost:8080/api/getMultiParameter2?account=abcd&email=study@gmail.com&page=10
    @GetMapping("/getMultiParameter2")
    public SearchParam getMultiParameter2(SearchParam searchParam) {
        System.out.println(searchParam.getAccount());
        System.out.println(searchParam.getEmail());
        System.out.println(searchParam.getPage());

        return searchParam;
    }

}
