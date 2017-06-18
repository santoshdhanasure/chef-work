require "serverspec"

set :backend, :exec


describe "apache", :if => os[:family] == 'ubuntu' do

	it "is good" do
		expect(true).to eq true
	end

	it "is installed" do
		expect(package "apache2").to be_installed
	end

	it "is running" do
		expect(service "apache2").to be_running
	end

	it "is return our custom page" do
		expect(command("curl http://localhost").stdout).to match /hello/i
	end

	it "is listening to the port" do
		expect(port "80").to be_listening
	end
end

describe "httpd", :if => os[:family] == 'redhatssss' do

        it "is good" do
                expect(true).to eq true
        end

        it "is installed" do
                expect(package "httpd").to be_installed
        end

        it "is running" do
                expect(service "httpd").to be_running
        end

        it "is return our custom page" do
                expect(command("curl http://localhost").stdout).to match /hello/i
        end

        it "is listening to the port" do
                expect(port "80").to be_listening
        end

end

