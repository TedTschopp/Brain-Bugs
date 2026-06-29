import { expect, test } from '@playwright/test';

const paths = [
  '/',
  '/topics/',
  '/topics/logical-fallacies/',
  '/errors/ad-hominem/',
  '/compare/fallacies-vs-biases/',
  '/practice/',
  '/practice/quizzes/five-quick-calls/',
  '/search/',
  '/glossary/',
  '/stories/',
  '/real-life/'
];

for (const path of paths) {
  test(`renders ${path}`, async ({ page }) => {
    await page.goto(path);
    await expect(page.locator('body')).toHaveClass(/bb-body/);
    await expect(page.locator('#main-content')).toBeVisible();
  });
}

test('quiz answer feedback works', async ({ page }) => {
  await page.goto('/practice/quizzes/five-quick-calls/');
  const firstCard = page.locator('[data-bb-practice-card]').first();
  await firstCard.locator('[data-bb-practice-option]').first().click();
  await expect(firstCard.locator('[data-bb-feedback]')).toBeVisible();
});