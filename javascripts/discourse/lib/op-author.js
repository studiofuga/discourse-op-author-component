import { settings } from "virtual:theme";

function categoryPath(category) {
  const parts = [];
  for (let c = category; c; c = c.parentCategory) {
    parts.unshift(c.slug);
  }
  return parts.join("/");
}

function configuredPaths() {
  return (settings.op_author_categories || "")
    .split("|")
    .map((p) => p.trim().replace(/^\/+|\/+$/g, ""))
    .filter(Boolean);
}

// True when the topic belongs to a configured category (or one of its subcategories)
export function isOpAuthorTopic(topic) {
  if (!topic?.category) {
    return false;
  }
  const path = categoryPath(topic.category);
  return configuredPaths().some((p) => path === p || path.startsWith(`${p}/`));
}

// The original poster entry from topic.posters (always the first one)
export function originalPoster(topic) {
  return topic?.posters?.[0];
}
