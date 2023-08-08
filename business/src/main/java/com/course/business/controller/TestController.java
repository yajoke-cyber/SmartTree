package com.course.business.controller;

import com.course.server.dto.ResponseDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RefreshScope
@RestController
@RequestMapping("/test")
public class TestController {

    @Value("${business.test:TTTT}")
    private String systemTest;

    @GetMapping("/list")
    public ResponseDto list() {
        ResponseDto responseDto = new ResponseDto();
        responseDto.setContent(systemTest);
        return responseDto;
    }
}
