package com.atguigu.test;

import com.atguigu.bean.Department;
import com.atguigu.bean.Employee;
import com.atguigu.dao.DepartmentMapper;
import com.atguigu.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @author xzt
 * @create 2020-08-28 19:48
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;
    /**
     * 测试DepartmentMapper
     */
    @Test
    public void testCRUD(){
//        //1、创建SpringIOC容器
//        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        //2、从容器中获取mapper
//        DepartmentMapper departmentMapper = context.getBean(DepartmentMapper.class);
//        System.out.println(departmentMapper);
//        Department department1 = new Department(null,"开发部");
//        Department department2 = new Department(null,"测试部");
//        departmentMapper.insertSelective(department1);
//        departmentMapper.insertSelective(department2);
//        Employee employee = new Employee(null, "Jerry", "M", "Jerry@atguigu.com", 1);
//        employeeMapper.insertSelective(employee);

        //批量插入
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for(int i = 0; i < 100; i++){
            String s = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employee(null,s,"M",s + "@atguigu.com",1));
        }

    }

}
