// AddContactsAccounts1 method

public with sharing class AddContactsAccounts1
{

// public List <AddCon> customContacts {get; set;}
public List <Account> accounts ;
public List <Contact> contacts1{get; set;}
public Map <Integer,List<Contact>> mapIntVsConList{get; set;}
public Map <Integer,Account> mapIntVsAcc{get; set;}
public Integer i ;
public Integer j ;
public Account acc {get; set;}
public Contact con {get; set;}

public AddContactsAccounts1()
{
i=0;j=0;
accounts = new List<Account>();
mapIntVsConList = new Map <Integer,List<Contact>>();
mapIntVsAcc = new Map <Integer,Account>();
// customAccounts = new List <AddAcc> ();
//customContacts = new List <AddCon> ();
contacts1 = new List<Contact>();
// AddAcc customAccount = new AddAcc();
// customAccounts.add(customAccount);
acc = new Account();
mapIntVsAcc.put(i,acc);
mapIntVsConList.put(i,contacts1);
}

public void addNewAccount()
{
i++;
//customContacts = new List <AddCon> ();
acc = new Account();
mapIntVsAcc.put(i,acc);
contacts1 = new List<contact>();
mapIntVsConList.put(i,contacts1);

}
public void addNewContact()
{
con = new Contact();
contacts1.add(con);
mapIntVsConList.put(i,contacts1);
}

public PageReference insertAccountsContacts()
{
//i=0;
//Map <Id,List<Contact>> mapAccIdVsCon = new Map <Id,List<Contact>>();
PageReference pageRefer = new PageReference('/apex/AddContactsAccountsPage1');
/*for (AddAcc customAccount : customAccounts)
{
accounts.add(customAccount.acc);
}*/
//system.debug('accounts::::'+accounts);
List<Contact> conList = new List<Contact>();
for(Integer i : mapIntVsAcc.keySet())
{
accounts.add(mapIntVsAcc.get(i));
}
insert accounts;
j = 0;
for(Account a : accounts)
{
//List <Contact> contacts = new List <Contact>();
for(Contact c : mapIntVsConList.get(j))
{
c.accountId = a.Id;
conList.add(c);
}
// mapAccIdVsCon.put(a.Id, contacts);
j++;
}
//system.debug('contacts::::'+contacts);

/* for(Id ide :mapAccIdVsCon.keySet())
{
for(Contact c : mapAccIdVsCon.get(ide))
{
conList.add(c);
}
}*/
insert conList;

pageRefer.setRedirect(True);
return pageRefer;
// return Page.AddContactsAccountsPage1;
}
}