public with sharing class AccountController {
/* deploying through mcp*/
    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getAccounts(Integer displayCount) {
        Integer total = [SELECT COUNT() FROM Account];
        Integer lim = (displayCount != null && displayCount >= 2 && displayCount <= 5) ? displayCount : 5;
        List<Account> accounts = [
            SELECT Id, Name, Industry, Phone, AnnualRevenue, Rating
            FROM Account
            ORDER BY Name ASC
            LIMIT :lim
        ];
        return new Map<String, Object>{
            'accounts' => accounts,
            'total'    => total
        };
    }
}
