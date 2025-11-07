import { Page } from '@playwright/test';
export class AdminPageBase {
    protected page: Page;
    
    constructor(page: Page) {
        this.page = page;
    }

    async login(username: string, password: string): Promise<void> {
        await this.page.goto('/account/login?ReturnUrl=%2Fadmin');
        await this.page.fill('input[name="UserID"]', username);
        await this.page.fill('input[name="PassWord"]', password);
        await this.page.click('input[type="submit"]');
        await this.page.waitForURL('/admin');
    }
    
    async logout(): Promise<void> {
        await this.page.goto('http://demo.zkea.net/account/logout');
        await this.page.waitForURL('/index');
    }
}