import { Page } from '@playwright/test';
import { PageBase } from '@models/PageBase';

export abstract class AdminPageBase extends PageBase {

    constructor(page: Page) {
        super(page);
    }

    async login(username?: string, password?: string): Promise<void> {
        // Use provided credentials or fall back to environment variables, with 'admin' as final fallback
        const user = username || process.env.ADMIN_USERNAME || 'admin';
        const pass = password || process.env.ADMIN_PASSWORD || 'admin';
        
        await this.page.goto('/account/login?ReturnUrl=%2Fadmin');
        await this.page.fill('input[name="UserID"]', user);
        await this.page.fill('input[name="PassWord"]', pass);
        await this.page.click('input[type="submit"]');
        await this.page.waitForURL('/admin');
    }
    
    async logout(): Promise<void> {
        await this.page.goto('http://demo.zkea.net/account/logout');
        await this.page.waitForURL('/index');
    }
}