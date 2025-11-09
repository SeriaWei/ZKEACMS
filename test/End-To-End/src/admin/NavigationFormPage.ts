import { Page, Locator } from '@playwright/test';
import { AdminPageBase } from '@models/AdminPageBase';

export interface NavigationFormData {
  title: string;
  url: string;
  isMobile?: boolean;
  html?: string;
  status?: '有效' | '无效';
  description?: string;
}

export class NavigationFormPage extends AdminPageBase {
  // Form fields
  readonly titleInput: Locator;
  readonly urlInput: Locator;
  readonly isMobileCheckbox: Locator;
  readonly htmlTextarea: Locator;
  readonly statusSelect: Locator;
  readonly descriptionTextarea: Locator;

  // Action buttons
  readonly saveButton: Locator;
  readonly saveAndExitButton: Locator;
  readonly convertToStaticPathButton: Locator;
  readonly cancelButton: Locator;

  constructor(page: Page) {
    super(page);
    // Form fields locators
    this.titleInput = page.locator('#Title');
    this.urlInput = page.locator('#Url');
    this.isMobileCheckbox = page.locator('#IsMobile');
    this.htmlTextarea = page.locator('#Html');
    this.statusSelect = page.locator('#Status');
    this.descriptionTextarea = page.locator('#Description');

    // Action buttons locators
    this.saveButton = page.locator('input[value="保存"]');
    this.saveAndExitButton = page.locator('input[value="保存并退出"]');
    this.convertToStaticPathButton = page.locator('input[value="转为伪静态路径"]');
    this.cancelButton = page.locator('a:has-text("取消")');
  }

  /**
   * Navigates to the navigation creation page
   */
  async navigateTo(): Promise<void> {
    await this.page.goto('/admin/navigation/create');
    await this.waitForPageLoad();
  }

  /**
   * Waits for the navigation form page to load completely
   */
  async waitForPageLoad(): Promise<void> {
    await this.page.waitForURL('**/admin/navigation/create');
    await this.titleInput.waitFor({ state: 'visible' });
  }

  /**
   * Fills the navigation form with provided data
   * @param formData - Navigation form data to fill
   */
  async fillNavigationForm(formData: NavigationFormData): Promise<void> {
    await this.titleInput.fill(formData.title);
    await this.urlInput.fill(formData.url);

    if (formData.isMobile !== undefined) {
      if (formData.isMobile) {
        await this.isMobileCheckbox.check();
      } else {
        await this.isMobileCheckbox.uncheck();
      }
    }

    if (formData.html) {
      await this.htmlTextarea.fill(formData.html);
    }

    if (formData.status) {
      await this.statusSelect.selectOption(formData.status);
    }

    if (formData.description) {
      await this.descriptionTextarea.fill(formData.description);
    }
  }

  /**
   * Clicks the save button to create the navigation item
   */
  async clickSave(): Promise<void> {
    await this.saveButton.click();
  }

  /**
   * Clicks the save and exit button to create and exit
   */
  async clickSaveAndExit(): Promise<void> {
    await this.saveAndExitButton.click();
  }

  /**
   * Clicks the cancel button to return to navigation list
   */
  async clickCancelButton(): Promise<void> {
    await this.cancelButton.click();
  }

  /**
   * Converts the URL to static path
   */
  async convertUrlToStaticPath(): Promise<void> {
    await this.convertToStaticPathButton.click();
  }

  /**
   * Creates a new navigation item with the provided data
   * @param formData - Navigation form data to fill
   * @param saveAndExit - Whether to click save and exit button
   */
  async createNavigation(formData: NavigationFormData, saveAndExit: boolean = false): Promise<void> {
    await this.fillNavigationForm(formData);
    
    if (saveAndExit) {
      await this.clickSaveAndExit();
    } else {
      await this.clickSave();
    }
  }
}