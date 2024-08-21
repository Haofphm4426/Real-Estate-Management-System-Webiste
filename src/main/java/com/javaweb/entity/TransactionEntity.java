package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "transaction")
public class TransactionEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "code", nullable = false, unique = true)
    private String code;

    @Column(name = "note", nullable = false)
    private String note;

    @ManyToOne
    @JoinColumn(name="staffid")
    private UserEntity transactionStaff;

    @ManyToOne
    @JoinColumn(name="customerid")
    private CustomerEntity transactionCustomer;
}
