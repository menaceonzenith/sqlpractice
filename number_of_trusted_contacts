https://leetcode.com/problems/number-of-trusted-contacts-of-a-customer/

SELECT invoice_id,
       sub.customer_name,
       price,
       contacts_cnt,
       trusted_contacts_cnt
FROM (SELECT Customers.customer_name,
             Customers.customer_id,
       SUM(CASE WHEN contacts.user_id IS NOT NULL THEN 1 ELSE 0 END) as contacts_cnt,
       SUM(CASE WHEN contacts.contact_email IN (SELECT email FROM customers) THEN 1 ELSE 0 END) as trusted_contacts_cnt
FROM Customers
LEFT JOIN Contacts
ON customers.customer_id = contacts.user_id
GROUP BY 1) sub
LEFT JOIN invoices
ON sub.customer_id = invoices.user_id
WHERE invoice_id IS NOT NULL
ORDER BY 1 
