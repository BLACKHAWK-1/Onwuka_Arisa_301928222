# Portfolio 1 — Database Design and Modelling

I organised the data into customer, restaurant, menu_item, food_order, order_item. The design document explains the fields, keys, relationships and business rules. The normalisation document shows the sample tables at 1NF, 2NF and 3NF.

## Database checks

| Table | Rows |
| --- | --- |
| customer | 1 |
| restaurant | 1 |
| menu_item | 2 |
| food_order | 2 |
| order_item | 1 |

The 39 invalid inserts were rejected at their expected constraints, and the valid sample rows remained unchanged.

## Files

- [Design](Onwuka_Arisa_301928222_P1_Design.md)
- [ER diagram](Onwuka_Arisa_301928222_P1_ERDiagram.md)
- [Normalisation](Onwuka_Arisa_301928222_P1_Normalisation.md)
- [Schema](Onwuka_Arisa_301928222_P1_Schema.sql)
- [Sample data](Onwuka_Arisa_301928222_P1_SampleData.sql)
- [Constraint tests](Onwuka_Arisa_301928222_P1_ConstraintTests.sql)
- [Table and constraint evidence](screenshots/Onwuka_Arisa_301928222_P1_DatabaseResults.png)

## Run the SQL

Create a fresh PostgreSQL database. Run the schema first, then the sample data. Run the deliberately invalid statements in ConstraintTests.sql individually outside a transaction; each is expected to produce an error.

## References

- [PostgreSQL — constraints](https://www.postgresql.org/docs/17/ddl-constraints.html)

