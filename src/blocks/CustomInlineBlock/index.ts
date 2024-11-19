import { Block, FieldHook } from "payload";

export const CustomInlineBlock: Block = {
  slug: "customInlineBlock",
  admin: {
    components: {
      Label: {
        path: "@/components/admin/LabelComponent",
      },
    },
  },
  labels: {
    singular: "Custom Inline Block",
    plural: "Custom Inline Blocks",
  },
  fields: [
    {
      name: "text",
      type: "text",
      label: "Text",
      required: false,
    },
  ],
};
