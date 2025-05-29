package com.xu.store.mapper;

import com.xu.store.entity.order.Expense;
import org.springframework.stereotype.Repository;

/**
 * @author: 许瑞仕
 * @date: 2020/7/20 16:43
 * @description:
 */
@Repository
public interface ExpenseMapper {
    int addExpense(Expense expense);
}
