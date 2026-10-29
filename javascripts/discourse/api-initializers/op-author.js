import { apiInitializer } from "discourse/lib/api";
import OpPostersCell from "../components/op-posters-cell";

export default apiInitializer((api) => {
  // Desktop topic list: "posters" column
  api.registerValueTransformer("topic-list-columns", ({ value: columns }) => {
    if (columns.has("posters")) {
      columns.add("posters", { item: OpPostersCell });
    }
    return columns;
  });
});
