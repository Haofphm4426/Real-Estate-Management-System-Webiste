package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingResponseDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public void queryJoinClause (BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        Long rentAreaFrom = buildingSearchRequest.getAreaFrom();
        Long rentAreaTo = buildingSearchRequest.getAreaTo();
        if(rentAreaFrom != null || rentAreaTo != null) {
            sql.append(" JOIN rentarea r on r.buildingid = b.id");
        }

        Long staffId = buildingSearchRequest.getStaffId();
        if(staffId != null){
            sql.append(" JOIN assignmentbuilding asm on asm.buildingid = b.id");
        }
    }

    public void queryWhereNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields(); // Lấy tất cả các fields trong class
            for(Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName(); //Lấy tên của field
                if(!fieldName.equals("staffId")
                        && !fieldName.equals("typeCode")
                        && !fieldName.startsWith("area")
                        && !fieldName.startsWith("rentPrice")) {
                    Object value = item.get(buildingSearchRequest);
                    if(value != null && value != "") {
                        if(item.getType().getName().equals("java.lang.Long")) {
                            where.append(" AND b." + fieldName.toLowerCase() + " = " + value);
                        }
                        else if(item.getType().getName().equals("java.lang.Interger")) {
                            where.append(" AND b." + fieldName.toLowerCase() + " = " + value);
                        }
                        else if(item.getType().getName().equals("java.lang.String")) {
                            where.append(" AND b." + fieldName.toLowerCase() + " LIKE '%" + value  + "%'");
                        }
                    }
                }
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    public void queryWhereSpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        Long staffId  = buildingSearchRequest.getStaffId();
        if(staffId != null) {
            where.append(" AND asm.staffid = " + staffId);
        }

        Long rentAreaFrom = buildingSearchRequest.getAreaFrom();
        Long rentAreaTo = buildingSearchRequest.getAreaTo();
        if(rentAreaFrom != null) {
            where.append(" AND r.value >= " + rentAreaFrom);
        }
        if(rentAreaTo != null) {
            where.append(" AND r.value <= " + rentAreaTo);
        }

        Long rentPriceFrom = buildingSearchRequest.getRentPriceFrom();
        Long rentPriceTo = buildingSearchRequest.getRentPriceTo();
        if(rentPriceFrom != null) {
            where.append(" AND b.rentprice >= " + rentPriceFrom);
        }
        if(rentPriceTo != null) {
            where.append(" AND b.rentprice <= " + rentPriceTo);
        }

        List<String> typeCode = buildingSearchRequest.getTypeCode();
        if(typeCode != null && !typeCode.isEmpty()) {
            //where.append(" AND (");
            String sqlJoin = typeCode.stream().map(i -> i).collect(Collectors.joining(","));
            where.append(" AND b.type LIKE '%" + sqlJoin + "%'");
        }
    }

    @Override
    public int countTotalItem(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM Building b");
        queryJoinClause(buildingSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1");
        queryWhereNormal(buildingSearchRequest, where);
        queryWhereSpecial(buildingSearchRequest, where);
        sql.append(where + " GROUP BY b.id");
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList().size();
    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM Building b");
        queryJoinClause(buildingSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1");
        queryWhereNormal(buildingSearchRequest, where);
        queryWhereSpecial(buildingSearchRequest, where);
        sql.append(where + " GROUP BY b.id");
        sql.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
           .append(" OFFSET ").append(pageable.getOffset());

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        return query.getResultList();
    }




}
