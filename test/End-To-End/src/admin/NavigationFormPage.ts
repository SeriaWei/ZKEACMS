import { Page, Locator } from '@playwright/test';
import { AdminPageBase } from '@models/AdminPageBase';

export interface NavigationFormData {
  title?: string;
  url?: string;
  isMobile?: boolean;
  html?: string;
  status?: string;
  description?: string;
}

export class NavigationFormPage extends AdminPageBase {
  // Form fields
  readonly titleInput = this.page.locator('#Title');
  readonly urlInput = this.page.locator('#Url');
  readonly isMobileCheckbox = this.page.locator('#IsMobile');
  readonly htmlTextarea = this.page.locator('#Html');
  readonly statusSelect = this.page.locator('#Status');
  readonly descriptionTextarea = this.page.locator('#Description');

  // Action buttons
  readonly saveButton = this.page.locator('input[value="保存"]');
  readonly saveAndExitButton = this.page.locator('input[value="保存并退出"]');
  readonly convertToStaticPathButton = this.page.locator('input[value="转为伪静态路径"]');
  readonly cancelButton = this.page.locator('a:has-text("取消")');

  constructor(page: Page) {
    super(page);
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
    await this.fill(this.titleInput, formData.title);
    await this.fill(this.urlInput, formData.url);
    await this.fill(this.isMobileCheckbox, formData.isMobile);
    await this.fill(this.htmlTextarea, formData.html);
    await this.fill(this.statusSelect, formData.status);
    await this.fill(this.descriptionTextarea, formData.description);
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