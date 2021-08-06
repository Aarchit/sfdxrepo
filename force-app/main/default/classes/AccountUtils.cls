// craeting AccountUtils class 
public class AccountUtils {
   //  accountsByState method to Accountutil class
    public static List<Account> accountsByState (String accountState){
        
        List<Account> searchedResults = [SELECT Name FROM Account WHERE BillingState= :accountState];
        
        return searchedResults;
    }

}