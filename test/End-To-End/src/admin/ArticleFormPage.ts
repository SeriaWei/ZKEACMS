import { Page, Locator } from '@playwright/test';
import { AdminPageBase } from '@models/AdminPageBase';

export class ArticleFormPage extends AdminPageBase {
  // Form fields
  readonly titleField: Locator;
  readonly urlField: Locator;
  readonly summaryField: Locator;
  readonly metaKeywordsField: Locator;
  readonly metaDescriptionField: Locator;
  readonly counterField: Locator;
  readonly contentFrame: Locator;
  readonly imageThumbUrlField: Locator;
  readonly imageUrlField: Locator;
  readonly articleTypeField: Locator;
  readonly publishDateField: Locator;
  readonly statusDropdown: Locator;
  readonly descriptionField: Locator;

  // Buttons
  readonly saveButton: Locator;
  readonly saveAndExitButton: Locator;
  readonly publishButton: Locator;
  readonly cancelButton: Locator;
  readonly randomUrlButton: Locator;

  // Article type dropdown elements
  readonly articleTypeDropdown: Locator;

  constructor(page: Page) {
    super(page);
    // Form fields locators
    this.titleField = page.locator('#Title');
    this.urlField = page.locator('#Url');
    this.summaryField = page.locator('#Summary');
    this.metaKeywordsField = page.locator('#MetaKeyWords');
    this.metaDescriptionField = page.locator('#MetaDescription');
    this.counterField = page.locator('#Counter');
    this.contentFrame = page.locator('#ArticleContent');
    this.imageThumbUrlField = page.locator('#ImageThumbUrl');
    this.imageUrlField = page.locator('#ImageUrl');
    this.articleTypeField = page.locator('#ArticleTypeID');
    this.publishDateField = page.locator('#PublishDate');
    this.statusDropdown = page.locator('#Status');
    this.descriptionField = page.locator('#Description');

    // Button locators
    this.saveButton = page.locator('input[data-value="Create"]');
    this.saveAndExitButton = page.locator('input[data-value="CreateAndExit"]');
    this.publishButton = page.locator('input[data-value="Publish"]');
    this.cancelButton = page.getByRole('link', { name: '取消' });
    this.randomUrlButton = page.locator('#Url').locator('..').getByRole('link');

    // Article type dropdown elements
    this.articleTypeDropdown = page.locator('#dropdown-tree-ArticleTypeID > .form-control');
  }

  /**
   * Navigates to the default page for this page model
   */
  async navigateTo(): Promise<void> {
    await this.page.goto('/admin/article/create');
    // should wait tinymce to load
    await this.page.frameLocator('#ArticleContent_ifr').locator('#tinymce').waitFor();
    await new Promise(resolve => setTimeout(resolve, 1000));
  }

  /**
   * Navigates to the article creation page
   */
  async navigateToCreate(): Promise<void> {
    await this.page.goto('/admin/article/create');
  }

  /**
   * Navigates to the edit page for a specific article
   * @param articleId The ID of the article to edit
   */
  async navigateToEdit(articleId: string): Promise<void> {
    await this.page.goto(`/admin/article/edit/${articleId}`);
  }

  /**
   * Fills the article form with provided data
   * @param articleData The data to fill in the form
   */
  async fillArticleForm(articleData: {
    title?: string,
    url?: string,
    summary?: string,
    metaKeywords?: string,
    metaDescription?: string,
    counter?: string,
    content?: string,
    imageThumbUrl?: string,
    imageUrl?: string,
    articleType?: string,
    publishDate?: string,
    status?: string,
    description?: string
  }): Promise<void> {
    if (articleData.title) await this.titleField.fill(articleData.title);
    if (articleData.url) await this.urlField.fill(articleData.url);
    if (articleData.summary) await this.summaryField.fill(articleData.summary);
    if (articleData.metaKeywords) await this.metaKeywordsField.fill(articleData.metaKeywords);
    if (articleData.metaDescription) await this.metaDescriptionField.fill(articleData.metaDescription);
    if (articleData.counter) await this.counterField.fill(articleData.counter);
    if (articleData.content) await this.page.locator('#ArticleContent_ifr').contentFrame().locator('#tinymce').fill(articleData.content);
    if (articleData.imageThumbUrl) await this.imageThumbUrlField.fill(articleData.imageThumbUrl);
    if (articleData.imageUrl) await this.imageUrlField.fill(articleData.imageUrl);
    if (articleData.publishDate) await this.publishDateField.fill(articleData.publishDate);
    if (articleData.description) await this.descriptionField.fill(articleData.description);

    // Select article type if provided
    if (articleData.articleType) {
      await this.selectArticleType(articleData.articleType);
    }

    // Select status if provided
    if (articleData.status) {
      await this.statusDropdown.selectOption(articleData.status);
    }
  }

  /**
   * Selects an article type from the dropdown tree
   * @param articleType The article type to select
   */
  async selectArticleType(articleType: string): Promise<void> {
    // Click the dropdown to open it
    if (await this.articleTypeDropdown.isVisible()) {
      await this.articleTypeDropdown.click();
    }

    const articleTypeOption = this.page.getByRole('treeitem', { name: articleType, exact: true });
    await articleTypeOption.click();
  }

  /**
   * Generates a random URL
   */
  async generateRandomUrl(): Promise<void> {
    await this.randomUrlButton.click();
  }

  /**
   * Saves the article form
   */
  async saveArticle(): Promise<void> {
    await this.saveButton.click();
  }

  /**
   * Saves the article and exits the form
   */
  async saveAndExit(): Promise<void> {
    await this.saveAndExitButton.click();
  }

  /**
   * Publishes the article
   */
  async publishArticle(): Promise<void> {
    await this.publishButton.click();
  }

  /**
   * Cancels the form and returns to the previous page
   */
  async cancel(): Promise<void> {
    await this.cancelButton.click();
  }
}