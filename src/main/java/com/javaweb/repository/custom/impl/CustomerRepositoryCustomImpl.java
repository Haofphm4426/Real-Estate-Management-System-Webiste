package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;

public class CustomerRepositoryCustomImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public void queryJoinClause (CustomerSearchRequest customerSearchRequest, StringBuilder sql) {
        Long staffId = customerSearchRequest.getStaffId();
        if(staffId != null){
            sql.append(" JOIN user_customer uc on uc.customer_id = c.id");
        }
    }

    public void queryWhereNormal(CustomerSearchRequest customerSearchRequest, StringBuilder where) {
        try {
            Field[] fields = CustomerSearchRequest.class.getDeclaredFields(); // Lấy tất cả các fields trong class
            for(Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName(); //Lấy tên của field
                if(!fieldName.equals("staffId")) {
                    Object value = item.get(customerSearchRequest);
                    if(value != null && value != "") {
                        if(item.getType().getName().equals("java.lang.Long")) {
                            where.append(" AND c." + fieldName.toLowerCase() + " = " + value);
                        }
                        else if(item.getType().getName().equals("java.lang.Integer")) {
                            where.append(" AND c." + fieldName.toLowerCase() + " = " + value);
                        }
                        else if(item.getType().getName().equals("java.lang.String")) {
                            where.append(" AND c." + fieldName.toLowerCase() + " LIKE '%" + value  + "%'");
                        }
                    }
                }

            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    public void queryWhereSpecial(CustomerSearchRequest customerSearchRequest, StringBuilder where) {
        Long staffId = customerSearchRequest.getStaffId();
        if (staffId != null) {
            where.append(" AND uc.user_id = " + staffId);
        }
    }


    @Override
    public List<CustomerEntity> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT c.* FROM Customer c");
        queryJoinClause(customerSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE c.is_active = 1");
        queryWhereNormal(customerSearchRequest, where);
        queryWhereSpecial(customerSearchRequest, where);
        sql.append(where + " GROUP BY c.id");
        sql.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());

        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    @Override
    public int countTotalItem(CustomerSearchRequest customerSearchRequest) {
        StringBuilder sql = new StringBuilder("SELECT c.* FROM Customer c");
        queryJoinClause(customerSearchRequest, sql);
        StringBuilder where = new StringBuilder(" WHERE c.is_active = 1");
        queryWhereNormal(customerSearchRequest, where);
        queryWhereSpecial(customerSearchRequest, where);
        sql.append(where + " GROUP BY c.id");
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }
}
