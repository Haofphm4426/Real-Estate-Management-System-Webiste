package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "customer")
public class CustomerEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="fullname")
    private String fullName;

    @Column(name="phone")
    private String phone;

    @Column(name="email")
    private String email;

    @Column(name="demand")
    private String demand;

    @Column(name="status")
    private String status;

    @Column(name="companyname")
    private String companyName;

    @Column(name="is_active")
    private Long isActive;

//    @ManyToMany(mappedBy = "customers", fetch = FetchType.LAZY)
//    private List<UserEntity> staffs = new ArrayList<>();

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_customer",
            joinColumns = @JoinColumn(name = "customer_id", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "user_id", nullable = false))
    private List<UserEntity> customerStaffs = new ArrayList<>();

    @OneToMany(mappedBy="transactionCustomer", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE}, orphanRemoval = true)
    private List<TransactionEntity> transactions = new ArrayList<>();
}
