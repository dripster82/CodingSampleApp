require 'rails_helper'

RSpec.describe 'shared/_flash.html.erb', type: :view do
    let(:flash_data) do
        {
            error: 'This is an error, RUN!',
            message: 'This is a message, Hello?',
            notice: 'This is a notice, Tests are running?'
        }
    end

    it 'renders correct flash elements' do
        allow(view).to receive(:flash).and_return(flash_data)
        render

        assert_select 'div', count: 3
        assert_select 'div.flash_error_message', text: 'This is an error, RUN!', count: 1
        assert_select 'div.flash_message_message', text: 'This is a message, Hello?', count: 1
        assert_select 'div.flash_notice_message', text: 'This is a notice, Tests are running?', count: 1
    end
end