package cn.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.demo.model.Member;

@Repository
public class MemberDao extends BaseDao<Member, Integer>
{
	
}
