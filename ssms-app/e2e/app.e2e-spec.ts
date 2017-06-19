import { SsmsAppPage } from './app.po';

describe('ssms-app App', () => {
  let page: SsmsAppPage;

  beforeEach(() => {
    page = new SsmsAppPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
