package com.example.app_money_manager.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.app_money_manager.dto.AuthResponse;
import com.example.app_money_manager.model.Login;
import com.example.app_money_manager.model.Transaction;
import com.example.app_money_manager.service.AuthenticationService;

@RestController
@CrossOrigin
public class ApisController {

    @Autowired
    private AuthenticationService authenticationService;

    private final List<Transaction> data = new ArrayList<>(Arrays.asList(
            new Transaction("2024/02/15 15:00:00", "a", "aa", 1000.0),
            new Transaction("2024/03/10 10:00:00", "b", "bb", -10.0),
            new Transaction("2024/03/10 12:00:00", "c", "cc", -20.0),
            new Transaction("2024/03/09 09:30:00", "d", "dd", -50.0)
    ));

    @PostMapping("/login")
    public AuthResponse checkLogin(@RequestBody Login login) {
        // Sử dụng Spring Security để xác thực và trả về JWT token
        AuthResponse response = authenticationService.authenticate(login);
        data.sort((o1, o2) -> o2.getDateTime().compareTo(o1.getDateTime()));
        return response;
    }

    @GetMapping("/get_months")
    public Set<String> getMonths() {
        Set<String> months = new HashSet<>();
        for (Transaction t : data) {
            String tmp = t.getDateTime().substring(0, 7) + "/01 00:00:00";
            months.add(tmp);
        }
        return months;
    }

    @GetMapping("/total")
    public double total() {
        double total = 0.0;
        for (Transaction t : data) {
            total += t.getAmount();
        }
        return total;
    }

    @GetMapping("/get_amounts")
    public List<Transaction> getAmounts(@RequestParam String month) {
        List<Transaction> r = new ArrayList<>();
        String monthMatch = month.substring(0, 7);
        for (Transaction t : data) {
            if (t.getDateTime().startsWith(monthMatch)) {
                r.add(t);
            }
        }
        return r;
    }

    @DeleteMapping("/remove")
    public void remove(@RequestBody Map<String, String> payload) {
        String dateTime = payload.get("dateTime");
        if (dateTime == null) throw new RuntimeException("Missing dateTime");

        int index = -1;
        for (int i = 0; i < data.size(); i++) {
            if (data.get(i).getDateTime().equals(dateTime)) {
                index = i;
                break;
            }
        }

        if (index != -1) {
            data.remove(index);
        } else {
            throw new RuntimeException("Not found");
        }
    }

    @PostMapping("/add")
    public void add(@RequestBody Transaction transaction) {
        for (Transaction t : data) {
            if (t.getDateTime().equals(transaction.getDateTime())) {
                throw new RuntimeException("Duplicate data");
            }
        }
        data.add(transaction);
    }

    @PostMapping("/edit")
    public void edit(@RequestBody Transaction transaction) {
        String dateTime = transaction.getDateTime();
        for (int i = 0; i < data.size(); i++) {
            if (data.get(i).getDateTime().equals(dateTime)) {
                data.set(i, transaction);
                return;
            }
        }
        throw new RuntimeException("Not found");
    }

    @GetMapping("/transaction")
    public List<Transaction> transaction(@RequestParam String month) {
        List<Transaction> listTransaction = new ArrayList<>();
        for (Transaction t : data) {
            String tmp = t.getDateTime().substring(0, 7);
            if (month.startsWith(tmp)) {
                listTransaction.add(t);
            }
        }
        return listTransaction;
    }
}

