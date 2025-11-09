import { Page } from "@playwright/test";

export abstract class PageBase {
    protected page: Page;

    constructor(page: Page) {
        this.page = page;
    }

    abstract navigateTo(): Promise<void>
}