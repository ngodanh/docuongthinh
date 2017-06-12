/**
 * 
 */
package net.codejava.spring.blo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import net.codejava.spring.dao.ContactDAO;
import net.codejava.spring.entities.ContactEntity;
import net.codejava.spring.model.Contact;

/**
 * @author Administrator
 *
 */
public class ContactBLOImpl implements ContactBLO{

	@Autowired
	private ContactDAO contactDAO;
	
	@Override
	public List<Contact> getListContact() {
		// Get data from DB
		List<ContactEntity> contactEntity = contactDAO.list();
		// Define new list model
		List<Contact> lstContact = new ArrayList<Contact>();
		// Convert to model
		for(int i = 0; i < contactEntity.size(); i++) {
			Contact contact = new Contact();
			ContactEntity source = contactEntity.get(i);
			contact.setId(source.getId());
			contact.setName(source.getName());
			contact.setEmail(source.getEmail());
			contact.setAddress(source.getAddress());
			contact.setTelephone(source.getTelephone());
			lstContact.add(contact);
		}
		return lstContact;
	}

	@Override
	public void saveContact(Contact contact) {
		ContactEntity contactEntity = new ContactEntity();
		contactEntity.setId(contact.getId());
		contactEntity.setName(contact.getName());
		contactEntity.setAddress(contact.getAddress());
		contactEntity.setEmail(contact.getEmail());
		contactEntity.setTelephone(contact.getTelephone());
		contactDAO.saveOrUpdate(contactEntity);
	}

	@Override
	public void deleteContact(int id) {
		contactDAO.delete(id);
	}

	@Override
	public Contact getContact(int id) {
		Contact contact = new Contact();
		contact = contactDAO.get(id);
		return contact;
	}

}
