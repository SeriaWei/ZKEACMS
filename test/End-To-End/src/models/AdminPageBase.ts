import { Locator, Page } from '@playwright/test';
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

    async fill(locator: Locator, value?: any): Promise<void> {
        if (value === null || value === undefined) {
            return;
        }

        const tagName = await locator.evaluate((el) => el.tagName.toLowerCase());
        if (tagName === 'select') {
            await locator.selectOption(value);
            return;
        } else if (tagName === 'input' && await locator.getAttribute('type') === 'checkbox') {
            if (value === true) {
                await locator.check();
            } else {
                await locator.uncheck();
            }
            return;
        }
        
        await locator.fill(value);
        await locator.blur();
    }

    async fillTinymceEditor(frameLocator: Locator, value?: string): Promise<void> {
        if (value === null || value === undefined) {
            return;
        }
        const frame = await frameLocator.contentFrame();
        if (frame) {
            await frame.locator('#tinymce').fill(value);
        }
    }

    async logout(): Promise<void> {
        await this.page.goto('/account/logout');
        await this.page.waitForURL('/index');
    }
}