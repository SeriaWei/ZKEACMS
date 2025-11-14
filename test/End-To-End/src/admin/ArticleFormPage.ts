import { Page, Locator } from '@playwright/test';
import { AdminPageBase } from '@models/AdminPageBase';

export class ArticleFormPage extends AdminPageBase {
  // Form fields
  readonly titleField = this.page.locator('#Title');
  readonly urlField = this.page.locator('#Url');
  readonly summaryField = this.page.locator('#Summary');
  readonly metaKeywordsField = this.page.locator('#MetaKeyWords');
  readonly metaDescriptionField = this.page.locator('#MetaDescription');
  readonly counterField = this.page.locator('#Counter');
  readonly contentFrame = this.page.locator('#ArticleContent');
  readonly imageThumbUrlField = this.page.locator('#ImageThumbUrl');
  readonly imageUrlField = this.page.locator('#ImageUrl');
  readonly articleTypeField = this.page.locator('#ArticleTypeID');
  readonly publishDateField = this.page.locator('#PublishDate');
  readonly statusDropdown = this.page.locator('#Status');
  readonly descriptionField = this.page.locator('#Description');

  // Buttons
  readonly saveButton = this.page.locator('input[data-value="Create"]');
  readonly saveAndExitButton = this.page.locator('input[data-value="CreateAndExit"]');
  readonly publishButton = this.page.locator('input[data-value="Publish"]');
  readonly cancelButton = this.page.getByRole('link', { name: '取消' });
  readonly randomUrlButton = this.page.locator('#Url').locator('..').getByRole('link');

  // Article type dropdown elements
  readonly articleTypeDropdown = this.page.locator('#dropdown-tree-ArticleTypeID > .form-control');

  constructor(page: Page) {
    super(page);
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
    await this.fill(this.titleField, articleData.title);
    await this.fill(this.urlField, articleData.url);
    await this.fill(this.summaryField, articleData.summary);
    await this.fill(this.metaKeywordsField, articleData.metaKeywords);
    await this.fill(this.metaDescriptionField, articleData.metaDescription);
    await this.fill(this.counterField, articleData.counter);
    await this.fillTinymceEditor(this.page.locator('#ArticleContent_ifr'), articleData.content);
    await this.fill(this.imageThumbUrlField, articleData.imageThumbUrl);
    await this.fill(this.imageUrlField, articleData.imageUrl);
    await this.fill(this.publishDateField, articleData.publishDate);
    await this.fill(this.descriptionField, articleData.description);

    // Select article type if provided
    if (articleData.articleType) {
      await this.selectArticleType(articleData.articleType);
    }

    // Select status if provided
    await this.fill(this.statusDropdown, articleData.status);
  }

  /**
   * Selects an article type from the dropdown tree
   * @param articleType The article type to select
   */
  async selectArticleType(articleType?: string): Promise<void> {
    if(articleType == null || articleType === undefined) {
      return;
    }
    
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