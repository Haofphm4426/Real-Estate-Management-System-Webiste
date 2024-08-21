package com.javaweb.converter;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.TransactionResponseDTO;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.utils.DateFormatterUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class TransactionConverter {
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private DateFormatterUtils dateFormatterUtils;

    public TransactionEntity convertToTransactionEntity(TransactionDTO transactionDTO) {
        if(transactionDTO.getId() != null) {
            TransactionEntity previousTransaction = transactionRepository.findById(transactionDTO.getId()).get();
            previousTransaction.setModifiedBy(SecurityUtils.getUsername());
            previousTransaction.setModifiedDate(new Date());
            previousTransaction.setNote(transactionDTO.getNote());
            return previousTransaction;
        }
        else {
            TransactionEntity transactionEntity = modelMapper.map(transactionDTO, TransactionEntity.class);
            transactionEntity.setCreatedBy(SecurityUtils.getUsername());
            transactionEntity.setCreatedDate(new Date());
            UserEntity staff = userRepository.findOneByUserNameAndStatus(SecurityUtils.getUsername(), 1);
            transactionEntity.setTransactionStaff(staff);
            return transactionEntity;
        }

    }

    public TransactionResponseDTO convertoToTransactionResponseDTO(TransactionEntity transactionEntity) {
        TransactionResponseDTO transactionDTO = modelMapper.map(transactionEntity, TransactionResponseDTO.class);
        transactionDTO.setCreatedDate(dateFormatterUtils.toNewDateFormat(transactionEntity.getCreatedDate()));
        if(transactionEntity.getModifiedDate() != null) {
            transactionDTO.setModifiedDate(dateFormatterUtils.toNewDateFormat(transactionEntity.getModifiedDate()));
        }
        return transactionDTO;
    }
}
