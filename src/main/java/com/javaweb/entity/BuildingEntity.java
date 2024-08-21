package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name="building")
public class BuildingEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="name")
    private String name;

    @Column(name="ward")
    private String ward;

    @Column(name="street")
    private String street;

    @Column(name="district")
    private String district;

    @Column(name="structure")
    private String structure;

    @Column(name="numberofbasement")
    private Long numberOfBasement;

    @Column(name="managername")
    private String managerName;

    @Column(name="managerphone")
    private String managerPhone;

    @Column(name="floorarea")
    private Long floorArea;

    @Column(name="direction")
    private String direction;

    @Column(name="level")
    private String level;

    @Column(name="rentprice")
    private Long rentPrice;

    @Column(name="rentpricedescription")
    private String rentPriceDescription;

    @Column(name="servicefee")
    private String serviceFee;

    @Column(name="carfee")
    private String carFee;

    @Column(name="motofee")
    private String motoFee;

    @Column(name="overtimefee")
    private String overtimeFee;

    @Column(name="waterfee")
    private String waterFee;

    @Column(name="electricityfee")
    private String electricityFee;

    @Column(name="deposit")
    private String deposit;

    @Column(name="payment")
    private String payment;

    @Column(name="renttime")
    private String rentTime;

    @Column(name="decorationtime")
    private String decorationTime;

    @Column(name="brokeragefee")
    private Long brokerageFee;

    @Column(name="type")
    private String type;

    @Column(name="note")
    private String note;

    @Column(name = "avatar")
    private String image;

    @OneToMany(mappedBy="building", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE}, orphanRemoval = true)
    private List<RentAreaEntity> rentAreas = new ArrayList<>();

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "assignmentbuilding",
            joinColumns = @JoinColumn(name = "buildingid", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "staffid", nullable = false))
    private List<UserEntity> staffs = new ArrayList<>();


    public List<RentAreaEntity> getRentAreas() {
        return rentAreas;
    }
    public void setRentAreas(List<RentAreaEntity> rentAreas) {
        this.rentAreas = rentAreas;
    }

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getWard() {
        return ward;
    }
    public void setWard(String ward) {
        this.ward = ward;
    }
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }

    public Long getNumberOfBasement() {
        return numberOfBasement;
    }
    public void setNumberOfBasement(Long numberOfBasement) {
        this.numberOfBasement = numberOfBasement;
    }
    public String getManagerName() {
        return managerName;
    }
    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }
    public String getManagerPhoneNumber() {
        return managerPhone;
    }
    public void setManagerPhoneNumber(String managerPhoneNumber) {
        this.managerPhone = managerPhoneNumber;
    }
    public Long getFloorArea() {
        return floorArea;
    }
    public void setFloorArea(Long floorArea) {
        this.floorArea = floorArea;
    }
    public String getDirection() {
        return direction;
    }
    public void setDirection(String direction) {
        this.direction = direction;
    }
    public String getLevel() {
        return level;
    }
    public void setLevel(String level) {
        this.level = level;
    }
    public Long getRentPrice() {
        return rentPrice;
    }
    public void setRentPrice(Long rentPrice) {
        this.rentPrice = rentPrice;
    }
    public String getServiceFee() {
        return serviceFee;
    }
    public void setServiceFee(String serviceFee) {
        this.serviceFee = serviceFee;
    }
    public Long getBrokerageFee() {
        return brokerageFee;
    }
    public void setBrokerageFee(Long brokerageFee) {
        this.brokerageFee = brokerageFee;
    }


}
