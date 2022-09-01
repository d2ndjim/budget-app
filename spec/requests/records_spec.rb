require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/records", type: :request do
  
  # Record. As you add validations to Record, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Record.create! valid_attributes
      get records_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      record = Record.create! valid_attributes
      get record_url(record)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_record_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      record = Record.create! valid_attributes
      get edit_record_url(record)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Record" do
        expect {
          post records_url, params: { record: valid_attributes }
        }.to change(Record, :count).by(1)
      end

      it "redirects to the created record" do
        post records_url, params: { record: valid_attributes }
        expect(response).to redirect_to(record_url(Record.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Record" do
        expect {
          post records_url, params: { record: invalid_attributes }
        }.to change(Record, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post records_url, params: { record: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested record" do
        record = Record.create! valid_attributes
        patch record_url(record), params: { record: new_attributes }
        record.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the record" do
        record = Record.create! valid_attributes
        patch record_url(record), params: { record: new_attributes }
        record.reload
        expect(response).to redirect_to(record_url(record))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        record = Record.create! valid_attributes
        patch record_url(record), params: { record: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested record" do
      record = Record.create! valid_attributes
      expect {
        delete record_url(record)
      }.to change(Record, :count).by(-1)
    end

    it "redirects to the records list" do
      record = Record.create! valid_attributes
      delete record_url(record)
      expect(response).to redirect_to(records_url)
    end
  end
end
