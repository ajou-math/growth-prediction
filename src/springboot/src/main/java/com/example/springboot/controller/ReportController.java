package com.example.springboot.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.example.springboot.domain.Image;
import com.example.springboot.domain.Privacy;
import com.example.springboot.domain.Recommend;
import com.example.springboot.domain.Report;
import com.example.springboot.domain.need.AgeService;
import com.example.springboot.domain.need.ResultDTO;
import com.example.springboot.repository.ImageRepository;
import com.example.springboot.repository.PrivacyRepository;
import com.example.springboot.repository.RecommendRepository;
import com.example.springboot.repository.ReportRepository;
import com.fasterxml.jackson.annotation.JsonKey;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.cj.jdbc.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ReportController {

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private ReportRepository reportRepository;

    @Autowired
    private PrivacyRepository privacyRepository;

    @Autowired
    private RecommendRepository recommendRepository;

    @PostMapping("/signin/result")
    public String report(Model model, ResultDTO resultDTO, @RequestParam("bone_image") MultipartFile file)
            throws Exception {
        // 성별, 키, 몸무게, 사진 등을 받아서 DB를 거치지 않고 바로 파이썬을 돌리고 받음

        Report report = new Report();
        Date date = new Date();
        StringBuilder sb = new StringBuilder();
        String url = new String();
        Image image = new Image();

        // blob----------------------------------------------------------------------------
        byte[] bytes = file.getBytes();
        image.setFilename(file.getOriginalFilename());
        try {
            image.setImage(Base64.getEncoder().encodeToString(file.getBytes()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        imageRepository.save(image);

        // String imgblob = new String((byte[]) image.getImage());
        model.addAttribute("imgblob", image.getImage());
        System.out.println(image.getImage());
        report.setReportxray(file.getOriginalFilename());

        // blob---------------------------------------------------------------------------

        // file image 가 없을 경우
        // if (file.isEmpty()) {
        // sb.append("none");
        // } else {
        // sb.append(date.getTime());
        // sb.append(file.getOriginalFilename());
        // }

        // if (!file.isEmpty()) {
        // String path = System.getProperty("user.dir");
        // System.out.println(path);
        // File p = new File(path);
        // p = p.getParentFile();
        // String pa = p.getParent();
        // System.out.println(pa);
        // url = pa + "/src/main/resources/static/img/xray/" + sb.toString();
        // // File dest1 = new File(url1);
        // String url2 = pa + "/build/resources/main/static/img/xray/" + sb.toString();
        // System.out.println(url);
        // File dest = new File(url);

        // try {
        // file.transferTo(dest);
        // } catch (IllegalStateException e) {
        // e.printStackTrace();
        // } catch (IOException e) {
        // e.printStackTrace();
        // }
        // // db에 파일 위치랑 번호 등록
        // report.setReportxray(sb.toString());
        // }
        // transferTo 사용
        // ----------------------------------------------------------------------

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
        privacy.setPrivacyenterday(ts);

        // 여기에 파이썬이랑 연동하는 키--------------------------------------------------
        URL jsonurl = new URL("http://127.0.0.1:5000/tospring/a/b/c");
        HttpURLConnection conn = (HttpURLConnection) jsonurl.openConnection();
        StringBuffer stb = new StringBuffer();
        ObjectMapper mapper = new ObjectMapper();
        try {
            Thread.sleep(6000);
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            conn.setDoOutput(true);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            while (br.ready()) {
                stb.append(br.readLine());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String jstr = stb.toString();
        Map<String, Object> listMap = mapper.readValue(jstr,
                new TypeReference<Map<String, Object>>() {
                });

        // System.out.println("list : " + listMap);
        // System.out.println("A : " + listMap.get("A"));
        // System.out.println("B : " + listMap.get("B"));
        // System.out.println("C : " + listMap.get("C"));

        // 여기까지------------------------------------------------------

        AgeService as = new AgeService();
        int age = as.yy(privacy);
        // String repath = "/growthprediction/img/xray/" + report.getReportxray();
        model.addAttribute("privacy", privacy);
        // model.addAttribute("repath", repath);
        model.addAttribute("reportxray", report.getReportxray());
        model.addAttribute("childname", resultDTO.getChildname());

        List<Privacy> privacylist = privacyRepository.findAllByPrivacychildid(privacy.getPrivacychildid());
        List<Report> reportlist = reportRepository.findAllByReportchildid(privacy.getPrivacychildid());
        model.addAttribute("privacylist", privacylist);
        model.addAttribute("reportlist", reportlist);
        model.addAttribute("currentage", age);

        // reportRepository.save(report);
        // privacyRepository.save(privacy);

        return "signin/result";
    }

    @PostMapping("/signin/recommend")
    public String recommend(Recommend recommend) {
        recommendRepository.save(recommend);

        return "redirect:/signin/main";
    }
}
