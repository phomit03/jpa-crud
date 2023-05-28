package com.example.jpademo.dao;

import com.example.jpademo.etity.UserEntity;
import com.example.jpademo.util.PersistenceUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.transaction.Transaction;
import java.util.List;
import java.util.Queue;

public class UserDAO {
    EntityManager entityManager;
    EntityTransaction transaction;

    public UserDAO() {
        entityManager = PersistenceUtil.getEntityManagerFactory().createEntityManager();
        transaction = entityManager.getTransaction();
    }

    public UserEntity getUserById(Integer id) {
        UserEntity userEntity = null;
        try {
            userEntity = entityManager.find(UserEntity.class, id);
        } finally {
            entityManager.close();
        }
        return userEntity;
    }

    public List<UserEntity> getAllUser(){
        try {
            Query query = entityManager.createQuery("SELECT a from UserEntity as a");
            return query.getResultList();
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void insertUser(UserEntity userEntity){
        try {
            transaction.begin();
            entityManager.persist(userEntity);
            transaction.commit();
        } catch (Exception e){
            System.out.println(e.getMessage());
            transaction.rollback();
        }
    }

    public void updateUser(UserEntity userEntity) {
        try {
            transaction.begin();
            entityManager.merge(userEntity);
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            transaction.rollback();
        }
    }

    public void deleteUser(Integer id){
            entityManager.remove(id);

    }

    public List<UserEntity> findUsersByName(String name) {
        List<UserEntity> users = null;
        try {
            transaction.begin();
            String query = "SELECT u FROM UserEntity u WHERE u.name = :name";
            users = entityManager.createQuery(query, UserEntity.class)
                    .setParameter("name", name)
                    .getResultList();
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            transaction.rollback();
        }
        return users;
    }
}
