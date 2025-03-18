package com.javaweb.model.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TransactionResponseDTO {
    private Long id;
    private String createdDate;
    private String createdBy;
    private String modifiedDate;
    private String modifiedBy;
    private String note;
}
