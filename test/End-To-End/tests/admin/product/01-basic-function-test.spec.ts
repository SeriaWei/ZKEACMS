import { test as base, expect } from '@playwright/test';
import { ProductFormPage } from '@admin/ProductFormPage';

const test = base.extend<{ productFormPage: ProductFormPage }>({
    productFormPage: async ({ page }, use) => {
        const productFormPage = new ProductFormPage(page);
        await productFormPage.login();
        await productFormPage.navigateTo();
        await use(productFormPage);
    }
});

test.describe('Product Form Page - Basic Functionality Tests', () => {

    test('should be able to create a product with required fields', async ({ page, productFormPage }) => {
        const timestamp = new Date().getTime();
        await productFormPage.fillProductForm({
            title: 'Test Product ' + timestamp,
            englishName: 'test-product-' + timestamp,
            image: '/tests/fixtures/images/sample-product.jpg',
            thumbnail: '/tests/fixtures/images/sample-thumbnail.jpg',
            category: '耳机',
            model: 'TP-' + timestamp,
            color: 'Black',
            price: '100.00',
            discountPrice: '80.00',
            costPrice: '60.00',
            specification: 'Test specification for the product.',
            warranty: '1 year',
            content: 'This is the detailed content of the test product.',
            seoTitle: 'Test Product SEO Title',
            seoKeywords: 'test, product, ecommerce',
            seoDescription: 'This is a test product for ecommerce platform.',
            sort: '1',
            source: 'Test Source',
            images: [
                {
                    title: 'Image 1',
                    url: '/tests/fixtures/images/sample-product.jpg',
                    stauts: '有效'
                },
                {
                    title: 'Image 2',
                    url: '/tests/fixtures/images/sample-thumbnail.jpg',
                    stauts: '无效'
                }
            ],
            description: 'This is a test product description.',
        });

        await productFormPage.save();

        await expect(page).toHaveURL(/\/admin\/product\/edit\/\d+/);
    });

    test('should be able to save and exit from the product form', async ({ page, productFormPage }) => {
        const timestamp = new Date().getTime();
        await productFormPage.fillProductForm({
            title: 'Test Product Save Exit ' + timestamp,
            englishName: 'test-product-' + timestamp,
            image: '/tests/fixtures/images/sample-product.jpg',
            thumbnail: '/tests/fixtures/images/sample-thumbnail.jpg',
            category: '耳机',
            price: '150.00',
            content: 'This is the detailed content of the test product.',
            images: [
                {
                    title: 'Image 1',
                    url: '/tests/fixtures/images/sample-product.jpg',
                    stauts: '有效'
                },
                {
                    title: 'Image 2',
                    url: '/tests/fixtures/images/sample-thumbnail.jpg',
                    stauts: '无效'
                }
            ]
        });

        await productFormPage.saveAndExit();

        await expect(page).toHaveURL(/\/admin\/product/);
    });

    test('should cancel and return to the product list page', async ({ page, productFormPage }) => {
        await productFormPage.cancel();
        await expect(page).toHaveURL(/\/admin\/product/);
    });

    test('should be able to publish a product', async ({ page, productFormPage }) => {
        const timestamp = new Date().getTime();
        await productFormPage.fillProductForm({
            title: 'Test Product Publish ' + timestamp,
            englishName: 'test-product-' + timestamp,
            image: '/tests/fixtures/images/sample-product.jpg',
            thumbnail: '/tests/fixtures/images/sample-thumbnail.jpg',
            category: '耳机',
            price: '200.00',
            content: 'This is the detailed content of the test product.',
        });
        page.once('dialog', dialog => {
            console.log(`Dialog message: ${dialog.message()}`);
            dialog.accept().catch(() => { });
        });
        await productFormPage.publish();

        await expect(page).toHaveURL(/\/admin\/product\/edit\/\d+/);
        await expect(page.getByText('已发布')).toBeVisible();
    });
});