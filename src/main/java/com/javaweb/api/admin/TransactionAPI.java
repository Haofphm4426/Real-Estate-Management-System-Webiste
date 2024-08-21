package com.javaweb.api.admin;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.ITransactionService;
import com.javaweb.service.impl.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/transactions")
public class TransactionAPI {
    @Autowired
    ITransactionService transactionService;

    @PostMapping()
    public void addOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO) {
        transactionService.addOrUpdateTransaction(transactionDTO);
    }

    @GetMapping("/{id}")
    public ResponseDTO loadDetailTransaction(@PathVariable("id") Long id) {
        return transactionService.loadTransaction(id);
    }

    @DeleteMapping()
    public void deleteTransactions(@RequestBody Long id) {
        transactionService.deleteTransactions(id);
    }
}
