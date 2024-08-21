package com.javaweb.model.response;

import com.javaweb.entity.BuildingEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class BuildingResponseDTO {
    private List<BuildingEntity> buildingEntities;
    private List<BuildingSearchResponse> buildingSearchResponses;
    private int totalBuilding;
}
