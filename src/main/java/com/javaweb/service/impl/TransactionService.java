package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TransactionService implements ITransactionService {
    @Autowired
    TransactionRepository transactionRepository;
    @Autowired
    TransactionConverter transactionConverter;

    @Override
    public void addOrUpdateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = transactionConverter.convertToTransactionEntity(transactionDTO);
        transactionRepository.save(transactionEntity);
    }

    @Override
    public ResponseDTO loadTransaction(Long id) {
        ResponseDTO result = new ResponseDTO();
        result.setData(transactionRepository.findById(id).get().getNote());
        result.setMessage("Success");
        return result;
    }

    @Override
    public void deleteTransactions(Long id) {
        transactionRepository.deleteById(id);
    }
}
