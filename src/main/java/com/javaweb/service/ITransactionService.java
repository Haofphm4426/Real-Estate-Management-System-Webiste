package com.javaweb.service;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;

public interface ITransactionService {
    public void addOrUpdateTransaction(TransactionDTO transactionDTO);
    public ResponseDTO loadTransaction(Long id);
    public void deleteTransactions(Long id);
}
