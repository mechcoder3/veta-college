package com.veta.utils;

import java.time.Year;
import java.util.concurrent.ThreadLocalRandom;

/**
 * RefGenerator — generates all reference numbers used in VETA College system.
 */
public class RefGenerator {

    /**
     * Application reference: VETA-2025-XXXXX
     */
    public static String applicationRef() {
        int year = Year.now().getValue();
        int num  = ThreadLocalRandom.current().nextInt(10000, 99999);
        return "VETA-" + year + "-" + num;
    }

    /**
     * Government-style control number: 9900-XXXX-XXXX-XXXX
     */
    public static String controlNumber() {
        return String.format("9900-%04d-%04d-%04d",
                ThreadLocalRandom.current().nextInt(1000, 9999),
                ThreadLocalRandom.current().nextInt(1000, 9999),
                ThreadLocalRandom.current().nextInt(1000, 9999));
    }

    /**
     * Student registration number: VETA/STU/2025/XXXX
     */
    public static String studentNumber(int sequence) {
        int year = Year.now().getValue();
        return String.format("VETA/STU/%d/%04d", year, sequence);
    }

    /**
     * Production order number: ORD-2025-XXXXX
     */
    public static String orderNumber() {
        int year = Year.now().getValue();
        int num  = ThreadLocalRandom.current().nextInt(10000, 99999);
        return "ORD-" + year + "-" + num;
    }
}
