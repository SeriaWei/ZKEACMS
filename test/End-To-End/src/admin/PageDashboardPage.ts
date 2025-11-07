import { Page } from "@playwright/test";
import { AdminPageBase } from "../models/AdminPageBase";

export class PageDashboardPage extends AdminPageBase {
    constructor(page: Page) {
        super(page);
    }

    async navigateTo(): Promise<void> {
        await this.page.goto('/admin/page');
        // wait ajax /admin/page/pagezones complete
        await this.page.waitForResponse(response => response.url().includes('/admin/page/getpagetree') && response.status() === 200);
    }
}