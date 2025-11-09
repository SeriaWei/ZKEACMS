import { test, expect } from '@playwright/test';
import { ArticleFormPage } from '../../../src/admin/ArticleFormPage';

test.describe('Article Form Page - Basic Functionality Tests', () => {
  let articleFormPage: ArticleFormPage;

  test.beforeEach(async ({ page }) => {
    // Initialize the page object
    articleFormPage = new ArticleFormPage(page);

    // Login before each test
    await articleFormPage.login();
    await articleFormPage.navigateTo();
  });

  test('should be able to create an article with required fields', async ({ page }) => {

    // Fill in the required fields
    const timestamp = new Date().getTime();
    await articleFormPage.fillArticleForm({
      title: 'Test Article ' + timestamp,
      url: 'test-article-' + timestamp,
      summary: 'This is a test article summary',
      content: 'This is the content of the test article.',
      articleType: '公司新闻' // News category
    });

    // Save the article
    await articleFormPage.saveArticle();

    await expect(page).toHaveURL(/\/admin\/article\/edit\/\d+/);
  });

  test('should generate a random URL when the random button is clicked', async ({ page }) => {

    // Initially the URL field should be empty
    await expect(articleFormPage.urlField).toBeEmpty();

    // Click the random URL button
    await articleFormPage.generateRandomUrl();

    // Check that the field now contains a value
    await expect(articleFormPage.urlField).not.toBeEmpty();
  });

  test('should be able to select an article type from the dropdown', async ({ page }) => {
    // Select an article type
    await articleFormPage.selectArticleType('公司新闻');

    // Check that the value has been set correctly
    const selectedArticleType = await articleFormPage.articleTypeField.inputValue();
    expect(selectedArticleType).not.toBe('');
  });

  test('should be able to save and exit from the article form', async ({ page }) => {
    // Fill in the required fields
    const timestamp = new Date().getTime();
    await articleFormPage.fillArticleForm({
      title: 'Test Article ' + timestamp,
      url: 'test-article-' + timestamp,
      summary: 'This is a test article summary',
      content: 'This is the content of the test article.',
      articleType: '公司新闻' // News category
    });

    // Save and exit
    await articleFormPage.saveAndExit();

    // After saving and exiting, we should be redirected to the article list page
    await expect(page).toHaveURL(/\/admin\/article/);
  });

  test('should cancel and return to the article list page', async ({ page }) => {

    // Click cancel
    await articleFormPage.cancel();

    // Should be redirected to the article list page
    await expect(page).toHaveURL(/\/admin\/article/);
  });


  test('should be able to save then publish article', async ({ page }) => {
    // Fill in the required fields
    const timestamp = new Date().getTime();
    await articleFormPage.fillArticleForm({
      title: 'Test Article ' + timestamp,
      url: 'test-article-' + timestamp,
      summary: 'This is a test article summary',
      content: 'This is the content of the test article.',
      articleType: '公司新闻' // News category
    });

    // Save and exit
    await articleFormPage.saveArticle();
    page.on('dialog', async dialog => {
      await dialog.accept();
    });
    await articleFormPage.publishArticle();
    // After saving and exiting, we should be redirected to the article list page
    await expect(articleFormPage.publishDateField).not.toBeEmpty();
    await expect(page.getByText('已发布')).toBeVisible();
  });

  test('should be able to publish article directly', async ({ page }) => {
    // Fill in the required fields
    const timestamp = new Date().getTime();
    await articleFormPage.fillArticleForm({
      title: 'Test Article ' + timestamp,
      url: 'test-article-' + timestamp,
      summary: 'This is a test article summary',
      content: 'This is the content of the test article.',
      articleType: '公司新闻' // News category
    });
    page.on('dialog', async dialog => {
      await dialog.accept();
    });

    // Publish directly
    await articleFormPage.publishArticle();
    // After publishing, we should see the publish date and status updated
    await expect(articleFormPage.publishDateField).not.toBeEmpty();
    await expect(page.getByText('已发布')).toBeVisible();
  });
});