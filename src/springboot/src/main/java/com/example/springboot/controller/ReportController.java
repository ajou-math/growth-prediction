package com.example.springboot.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.sql.Timestamp;
import java.util.Date;

import com.example.springboot.domain.Privacy;
import com.example.springboot.domain.Report;
import com.example.springboot.domain.dto.ResultDTO;
import com.example.springboot.repository.ChildRepository;
import com.example.springboot.repository.PrivacyRepository;
import com.example.springboot.repository.ReportRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ReportController {
    @Autowired
    private ChildRepository childRepository;

    @Autowired
    private ReportRepository reportRepository;

    @Autowired
    private PrivacyRepository privacyRepository;

    @PostMapping("/signin/result")
    public String report(Model model, ResultDTO resultDTO, @RequestParam("bone_image") MultipartFile file)
            throws Exception {
        // 성별, 키, 몸무게, 사진 등을 받아서 DB를 거치지 않고 바로 파이썬을 돌리고 받음

        Report report = new Report();
        Date date = new Date();
        StringBuilder sb = new StringBuilder();

        // file image 가 없을 경우
        if (file.isEmpty()) {
            sb.append("none");
        } else {
            sb.append(date.getTime());
            sb.append(file.getOriginalFilename());
        }

        if (!file.isEmpty()) {
            String path = System.getProperty("user.dir");
            File dest = new File(path + "/src/main/resources/static/img/xray/" + sb.toString());

            try {
                file.transferTo(dest);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            // db에 파일 위치랑 번호 등록
            report.setReportxray(sb.toString());
        }

        Privacy privacy = new Privacy();
        privacy.setPrivacychildid(resultDTO.getChildid());
        privacy.setPrivacygender(resultDTO.getChildgender());
        privacy.setPrivacybirth(resultDTO.getChildbirth());
        privacy.setPrivacytall(resultDTO.getChildheight());
        privacy.setPrivacyweight(resultDTO.getChildweight());
        privacy.setPrivacybornage(0);
        privacy.setPrivacypredicttall(0);

        report.setReportchildid(resultDTO.getChildid());
        report.setReportdoctorid(resultDTO.getDoctorid());
        report.setReportgender(resultDTO.getChildgender());
        report.setReportbornage(0);
        report.setReportpredicttall(0);
        long time = date.getTime();
        Timestamp ts = new Timestamp(time);
        report.setReportdate(ts);

        // 여기에 파이썬이랑 연동하는 키

        model.addAttribute("privacy", privacy);
        model.addAttribute("report", report);
        model.addAttribute("childname", resultDTO.getChildname());

        return "signin/result";
    }
}
