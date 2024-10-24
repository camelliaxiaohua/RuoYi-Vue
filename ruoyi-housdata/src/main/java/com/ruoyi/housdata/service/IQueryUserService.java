package com.ruoyi.housdata.service;

import com.ruoyi.housdata.domain.QueryUser;

import java.util.List;

/**
 * 信息查询Service接口
 *
 * @author camellia
 * @date 2024-10-24
 */
public interface IQueryUserService
{
    /**
     * 查询信息查询
     *
     * @param id 信息查询主键
     * @return 信息查询
     */
    public QueryUser selectQueryUserById(Long id);

    /**
     * 查询信息查询列表
     *
     * @param queryUser 信息查询
     * @return 信息查询集合
     */
    public List<QueryUser> selectQueryUserList(QueryUser queryUser);

    /**
     * 新增信息查询
     *
     * @param queryUser 信息查询
     * @return 结果
     */
    public int insertQueryUser(QueryUser queryUser);

    /**
     * 修改信息查询
     *
     * @param queryUser 信息查询
     * @return 结果
     */
    public int updateQueryUser(QueryUser queryUser);

    /**
     * 批量删除信息查询
     *
     * @param ids 需要删除的信息查询主键集合
     * @return 结果
     */
    public int deleteQueryUserByIds(Long[] ids);

    /**
     * 删除信息查询信息
     *
     * @param id 信息查询主键
     * @return 结果
     */
    public int deleteQueryUserById(Long id);
}
