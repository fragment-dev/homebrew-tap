require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5501.0.0-darwin-x64.tar.gz"
    sha256 "5fca6f4dad47801c1d5fe968da561f8c1b3be1063d6b4b35c1cd2ee408477f4f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5501.0.0-darwin-arm64.tar.gz"
      sha256 "9cc3a3f252e25c8499baf08057cff216512a8868eb0a11018bbbdddddfd63a88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5501.0.0-linux-x64.tar.gz"
    sha256 "823d6e395879c09fb8f47e5bcd996c1e8c3a41d84b115a3278fb229de5e126fb"
  end
  version "5501.0.0"
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
