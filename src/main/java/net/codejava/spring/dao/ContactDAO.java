package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.entities.ContactEntity;
import net.codejava.spring.model.Contact;

/**
 * Defines DAO operations for the contact model.
 * @author www.codejava.net
 *
 */
public interface ContactDAO {
	
	public void saveOrUpdate(ContactEntity contact);
	
	public void delete(int contactId);
	
	public Contact get(int contactId);
	
	public List<ContactEntity> list();
}
