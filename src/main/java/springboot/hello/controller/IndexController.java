package springboot.hello.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import springboot.hello.model.User;
import springboot.hello.model.ValidateForm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class IndexController {

    @GetMapping("/a")
    public String open() {
        return "index2";
    }

    @PostMapping("/transfer")
    public ResponseEntity<?> getTransferResultViaAjax(@RequestBody ValidateForm form, Errors errors) {
        ValidateForm result = new ValidateForm();
        if(errors.hasErrors()) {
            result.setMsg(errors.getAllErrors()
                    .stream().map(x-> x.getDefaultMessage())
                    .collect(Collectors.joining(",")));
            return ResponseEntity.badRequest().body(result);
        }
        return ResponseEntity.ok(result);
    }

    @GetMapping("/")
    public String index(){
        return "index";
    }

    @RequestMapping("/hello")
    public String hello(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("message", "HelloSpringBoot");
        return "formSign";
    }

    @ResponseBody
    @RequestMapping("/ajaxRequest")
    public ValidateForm rsps() throws Exception {
        ValidateForm msg = new ValidateForm();
        msg.setMsg("request recieved.");

        return msg;
    }
}
