/**
 * projectDocsData.js
 * Source of truth data store for Manager Projects, Documents, and Sheets.
 */

export const PROJECTS_DOCS_DATA = [];

/**
 * Helper to fetch all projects
 */
export function getAllProjects() {
  return PROJECTS_DOCS_DATA;
}

/**
 * Helper to fetch a project by ID
 */
export function getProjectById(id) {
  if (!id) return PROJECTS_DOCS_DATA[0] || null;
  const found = PROJECTS_DOCS_DATA.find(p => p && (p.id === id || (p.id && p.id.toUpperCase() === id.toUpperCase())));
  return found || PROJECTS_DOCS_DATA[0] || null;
}
