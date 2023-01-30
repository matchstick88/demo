package springboot.hello.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springboot.hello.model.exDAO;

import java.util.List;
import java.util.Map;

@RestController
public class TestController {
    @Autowired
    exDAO exd;

    @RequestMapping("/select")
    public List<Map<String,?>> getMessages() {
        return exd.selectAll();
    }

}
