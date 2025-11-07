import { test, expect, Page } from '@playwright/test';
import { PageFormData, PageFormPage } from '../../../src/admin/PageFormPage';

async function createPage(pageForm: PageFormPage): Promise<PageFormData> {
    const timeStamp = new Date().getTime();
    await pageForm.login('admin', 'admin');
    await pageForm.navigateTo();
    const formData = {
        name: 'Test Page' + timeStamp,
        title: 'This is a Test Page',
        path: 'test-page-' + timeStamp,
        layout: '默认',
        keywords: 'test, page',
        description: 'This is a description for the test page.',
        status: '1'
    } as PageFormData
    await pageForm.fillForm(formData);
    await pageForm.submitForm();
    formData.id = await pageForm.expectPageCreated();
    return formData;
}
test('Should create page successfully with primary fields', async ({ page }) => {
    var pageForm = new PageFormPage(page);
    await createPage(pageForm);
});

test('Should fail to create page with missing required fields', async ({ page }) => {
    var pageForm = new PageFormPage(page);
    await pageForm.login('admin', 'admin');
    await pageForm.navigateTo();
    pageForm.submitForm();
    await expect(page.locator('#PageName-error')).toBeVisible();
    await expect(page.locator('#PageUrl-error')).toBeVisible();
});

test('Should publish page successfully without any widgets', async ({ page }) => {
    var pageForm = new PageFormPage(page);
    const formData = await createPage(pageForm);
    await pageForm.publishPageInDesignView();
    await expect(page).toHaveURL(`/${formData.path}`);
});