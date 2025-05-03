
CALL `dev-arquitectura-jcorchuelom.silver_transaction.sp_load_product`
(
  'dev-arquitectura-jcorchuelom.silver_transaction.product',
  'bigquery-public-data.thelook_ecommerce.products' ,
  'dev-arquitectura-jcorchuelom.operation.tables'
);

CALL `dev-arquitectura-jcorchuelom.silver_transaction.sp_load_transaction`
(
  '2025-04-01',
  '2025-04-30',
  'dev-arquitectura-jcorchuelom.silver_transaction.transaction',
  'bigquery-public-data.thelook_ecommerce.order_items'
) ;


CALL `dev-arquitectura-jcorchuelom.gold_ba.sp_load_ba_sales`
(
  '2025-04' ,
  'dev-arquitectura-jcorchuelom.gold_ba.ba_sales',
  'dev-arquitectura-jcorchuelom.silver_transaction.transaction',
  'dev-arquitectura-jcorchuelom.silver_transaction.product'
) ;

CALL `dev-arquitectura-jcorchuelom.quality.sp_load_quantitative`
(
   'dev-arquitectura-jcorchuelom.quality.quantitative',
  'dev-arquitectura-jcorchuelom.gold_ba.ba_sales',
  '2025-04-01'
) ;
