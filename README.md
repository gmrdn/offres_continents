# OffresContinents

**Affichage du nombre d'offres par continent et par categorie de profession**

## Utilisation


```elixir
iex -S mix
iex(1)> OffresContinents.run()
+----------+-------+-------+----------+-------------------+--------+------+------+---------+
|          | TOTAL | Admin | Business | Marketing / Comm' | Retail | Tech | Créa | Conseil |
+----------+-------+-------+----------+-------------------+--------+------+------+---------+
| TOTAL    | 4965  | 407   | 1436     | 776               | 528    | 1431 | 212  | 175     |
| Afrique  | 9     | 1     | 3        | 1                 | 1      | 3    | 0    | 0       |
| Amérique | 167   | 9     | 31       | 12                | 93     | 15   | 7    | 0       |
| Asie     | 52    | 1     | 30       | 3                 | 7      | 11   | 0    | 0       |
| Europe   | 4734  | 396   | 1372     | 759               | 425    | 1402 | 205  | 175     |
| Océanie  | 3     | 0     | 0        | 1                 | 2      | 0    | 0    | 0       |
+----------+-------+-------+----------+-------------------+--------+------+------+---------+

:ok

```
