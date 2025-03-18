package com.javaweb.repository.custom;
//
//import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingResponseDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepositoryCustom {
    public List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    public int countTotalItem(BuildingSearchRequest buildingSearchRequest);
}
