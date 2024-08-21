package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TransactionRepository transactionRepository;

    public CustomerEntity convertToCustomerEntity(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
        if (customerDTO.getId() != null) {
            CustomerEntity customer = customerRepository.findById(customerDTO.getId()).get();
            customerEntity.setCreatedBy(customer.getCreatedBy());
            customerEntity.setCreatedDate(customer.getCreatedDate());
            customerEntity.setStatus(Status.getValueByStatusCode(customerDTO.getStatus()));

            List<UserEntity> staffs = userRepository.findByCustomers_Id(customerDTO.getId());
            customerEntity.setCustomerStaffs(staffs);

            List<TransactionEntity> transactions = transactionRepository.findByTransactionCustomer_Id(customerDTO.getId());
            customerEntity.setTransactions(transactions);
        }
        else {
            String statusCode = customerDTO.getStatus() != "" ? customerDTO.getStatus() : "CHUA_XU_LY";
            customerEntity.setStatus(Status.getValueByStatusCode(statusCode));
            customerEntity.setIsActive(1L);
        }
        return customerEntity;
    }
}
