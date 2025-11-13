import { test as base, expect } from '@playwright/test';
import { NavigationFormPage, NavigationFormData } from '@admin/NavigationFormPage';

const test = base.extend<{ navigationFormPage: NavigationFormPage }>({
  navigationFormPage: async ({ page }, use) => {
    const navigationFormPage = new NavigationFormPage(page);
    await navigationFormPage.login();
    await navigationFormPage.navigateTo();
    await use(navigationFormPage);
  },
});

test.describe('NavigationFormPage Tests', () => {
  test('should load the navigation creation page', async ({ page, navigationFormPage }) => {
    // Verify we're on the correct page
    await expect(page).toHaveURL(/.*\/admin\/navigation\/create/);

    // Verify the title input is visible
    await expect(navigationFormPage.titleInput).toBeVisible();

    // Verify other essential form elements are visible
    await expect(navigationFormPage.urlInput).toBeVisible();
    await expect(navigationFormPage.statusSelect).toBeVisible();
    await expect(navigationFormPage.saveButton).toBeVisible();
    await expect(navigationFormPage.cancelButton).toBeVisible();
  });

  test('should fill the navigation form with valid data', async ({ navigationFormPage }) => {
    const formData: NavigationFormData = {
      title: 'Test Navigation',
      url: '/test-url',
      isMobile: true,
      html: '<p>Test HTML content</p>',
      status: '有效',
      description: 'This is a test navigation item'
    };

    // Fill the navigation form
    await navigationFormPage.fillNavigationForm(formData);

    // Verify the values were entered correctly
    await expect(navigationFormPage.titleInput).toHaveValue(formData.title||"");
    await expect(navigationFormPage.urlInput).toHaveValue(formData.url||"");
    await expect(navigationFormPage.isMobileCheckbox).toBeChecked();
    await expect(navigationFormPage.htmlTextarea).toHaveValue(formData.html || '');
    await expect(navigationFormPage.statusSelect).toHaveValue('1'); // '有效' has value '1'
    await expect(navigationFormPage.descriptionTextarea).toHaveValue(formData.description || '');
  });

  test('should convert URL to static path', async ({ navigationFormPage }) => {
    // Fill the URL field with a test value
    await navigationFormPage.urlInput.fill('/test-url');

    // Get the initial value
    const initialValue = await navigationFormPage.urlInput.inputValue();
    await expect(initialValue).toBe('/test-url');

    // Click the convert to static path button
    await navigationFormPage.convertUrlToStaticPath();

    // Wait for the value to change
    // await page.waitForFunction(() => {
    //   const el = document.querySelector('#Url') as HTMLInputElement | null;
    //   return el !== null && el.value.endsWith('.html');
    // });

    // Verify the URL now ends with .html
    const newValue = await navigationFormPage.urlInput.inputValue();
    await expect(newValue).toBe('/test-url.html');
  });

  test('should navigate back to navigation list when cancel is clicked', async ({ page, navigationFormPage }) => {
    // Click the cancel button
    await navigationFormPage.clickCancelButton();

    // Wait for navigation to the list page
    await page.waitForURL('**/admin/navigation');

    // Verify we're on the navigation list page
    await expect(page).toHaveURL(/.*\/admin\/navigation$/);
  });

  test('should show validation errors when required fields are missing', async ({ page, navigationFormPage }) => {
    // Try to save without entering required fields
    await navigationFormPage.clickSave();

    // Wait for validation messages to appear
    await page.waitForSelector('.field-validation-error', { state: 'visible' });

    // Check that validation errors are shown for required fields
    const titleValidation = page.locator('[data-valmsg-for="Title"]');
    const urlValidation = page.locator('[data-valmsg-for="Url"]');

    await expect(titleValidation).toBeVisible();
    await expect(urlValidation).toBeVisible();

    // Verify the messages are present and not empty
    await expect(titleValidation).not.toHaveText('');
    await expect(urlValidation).not.toHaveText('');
  });

  test('should successfully create a navigation item', async ({ page, navigationFormPage }) => {
    const timestamp = new Date().getTime();
    const formData: NavigationFormData = {
      title: 'Test Navigation Item ' + timestamp,
      url: '/test-navigation-url',
      isMobile: false,
      html: '<p>Test HTML content for navigation</p>',
      status: '有效',
      description: 'This is a test navigation item created by Playwright'
    };

    // Fill the navigation form and submit
    await navigationFormPage.createNavigation(formData, true);

    // After successful creation, we should be redirected to the navigation list page
    await page.waitForURL('**/admin/navigation');
    await expect(page).toHaveURL(/.*\/admin\/navigation$/);

    // Verify that the new navigation item appears in the list
    // (This assumes there's a way to identify the newly created item in the list)
    const createdItem = page.locator(`text=${formData.title}`);
    await expect(createdItem).toBeVisible();
  });

});