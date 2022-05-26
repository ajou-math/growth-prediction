package com.example.springboot.domain.need;

import java.text.SimpleDateFormat;

import com.example.springboot.domain.Privacy;

public class AgeService {
    public int yy(Privacy privacy) {
        String year1 = privacy.getPrivacybirth().substring(0, 2);
        int y1 = Integer.parseInt(year1);
        SimpleDateFormat sdf = new SimpleDateFormat("yy");
        String year2 = sdf.format(privacy.getPrivacyenterday());
        int y2 = Integer.parseInt(year2);
        int age = y2 - y1; // 만 나이
        if (y1 > y2) {
            age = age + 100;
        }

        return age;
    }

    public String yyyyMMdd(Privacy privacy) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String result = sdf.format(privacy.getPrivacyenterday());

        return result;
    }
}
