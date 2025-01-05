SELECT 
  warehouse.warehouse_id,
  CONCAT(warehouse.state, ': ', warehouse.warehouse_alias) AS warehouse_name,
  COUNT(Orders.order_id) AS number_of_orders,
  (SELECT COUNT(*) FROM circular-beacon-445120-u0.warehouse_order.orders AS Orders) AS total_orders,
  CASE
    WHEN COUNT(Orders.order_id)/(SELECT COUNT(*) FROM circular-beacon-445120-u0.warehouse_order.orders AS Orders) <= 0.20
      THEN 'Fulfilled 0-20% of Orders'
    WHEN COUNT(Orders.order_id)/(SELECT COUNT(*) FROM circular-beacon-445120-u0.warehouse_order.orders AS Orders) > 0.20
    AND COUNT(Orders.order_id)/(SELECT COUNT(*) FROM circular-beacon-445120-u0.warehouse_order.orders AS Orders) <= 0.60
      THEN 'Fulfilled 21-60% of Orders'
    ELSE 'Fulfilled more than 60% of Orders'
  END AS fulfillment_summary
FROM 
  `circular-beacon-445120-u0.warehouse_order.warehouse` AS warehouse
  left join `circular-beacon-445120-u0.warehouse_order.orders` AS orders
  on orders.warehouse_id = warehouse.warehouse_id
  group by warehouse.warehouse_id, warehouse_name
HAVING
COUNT(Orders.order_id) > 0