require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5822.0.0-darwin-x64.tar.gz"
    sha256 "0245bfa9da9afaed201ec2b9dbdb746b775bc70a8f737d28719fba4a72cef112"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5822.0.0-darwin-arm64.tar.gz"
      sha256 "1c43bfcd14a120391ac98059d92878130a449563cb7121cdef97ca6a88885b10"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5822.0.0-linux-x64.tar.gz"
    sha256 "a42eb053553d9fc4dfd4dd95438f9c85aeb255367104db0ae912a039f8f911a7"
  end
  version "5822.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
