import { Page, expect } from "@playwright/test";
import { AdminPageBase } from "@models/AdminPageBase";
export interface PageFormData {
    id?: string;
    name?: string;
    title?: string;
    path?: string;
    layout?: string;
    keywords?: string;
    description?: string;
    status?: string;
}
export class PageFormPage extends AdminPageBase {
    constructor(page: Page) {
        super(page);
    }

    async navigateTo(): Promise<void> {
        await this.page.goto('/admin/page/create');
    }

    async fillForm(data: PageFormData): Promise<void> {
        await this.fill(this.page.locator('input[name="PageName"]'), data.name);
        await this.fill(this.page.locator('input[name="Title"]'), data.title);
        await this.fill(this.page.locator('input[name="PageUrl"]'), data.path);
        if (data.layout) {
            await this.page.locator('.layout-item').filter({ hasText: data.layout }).click();
        }
        await this.fill(this.page.locator('input[name="MetaKeyWorlds"]'), data.keywords);
        await this.fill(this.page.locator('input[name="MetaDescription"]'), data.description);
        await this.fill(this.page.locator('select[name="Status"]'), data.status);
    }
    async submitForm(): Promise<void> {
        await this.page.click('input[type="submit"]');
    }
    async expectPageCreated(): Promise<string> {
        await expect(this.page).toHaveURL(/\/admin\/page\/design\//);
        return await this.page.locator('input[id="pageId"]').getAttribute('value') as string;
    }
    async publishPageInDesignView(): Promise<void> {
        await expect(this.page).toHaveURL(/\/admin\/page\/design\//);
        await this.page.click('#toolBar a[href*="/admin/page/publishpage/"].zk-btn');
    }
}