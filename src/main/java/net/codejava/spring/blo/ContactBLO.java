/**
 * 
 */
package net.codejava.spring.blo;

import java.util.List;

import net.codejava.spring.model.Contact;

/**
 * @author Administrator
 *
 */
public interface ContactBLO {
	public List<Contact> getListContact();
	public void saveContact(Contact contact);
	public void deleteContact(int id);
	public Contact getContact(int id);
}
